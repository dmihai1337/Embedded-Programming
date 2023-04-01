library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.math_pkg.all;
use work.vram_pkg.all;
use work.gfx_cmd_pkg.all;


entity gfx_cmd_interpreter is
	generic (
		OUTPUT_DIR : string := "./"
	);
	port (
		clk   : in std_logic;

		gfx_cmd       : in std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
		gfx_cmd_wr    : in std_logic;
		gfx_frame_sync  : out std_logic;
		gfx_rd_data     : out std_logic_vector(15 downto 0);
		gfx_rd_valid    : out std_logic
	);
end entity;

architecture arch of gfx_cmd_interpreter is
	
	type abd_t is record 
		base : unsigned(20 downto 0);
		width : unsigned(14 downto 0);
		height : unsigned(14 downto 0);
	end record;
	
	type gp_t is record 
		x : signed(15 downto 0);
		y : signed(15 downto 0);
	end record;
	
	type bbe_t is record 
		maskop : std_logic_vector(1 downto 0);
		mask : std_logic_vector(7 downto 0);
	end record;
	
	type bdt_t is array (7 downto 0) of abd_t;
	
	type state_t is record
		abd : abd_t;
		gp : gp_t;
		primary_color : std_logic_vector(7 downto 0);
		secondary_color : std_logic_vector(7 downto 0);
		bdt: bdt_t;
		bbe : bbe_t;
		curr_out_addr : std_logic_vector(20 downto 0);
	end record;

	type operands_t is array (3 downto 0) of std_logic_vector(GFX_CMD_WIDTH-1 downto 0);

	signal state : state_t := (	abd => (	base => (others => '0'),
						   	height => (others => '0'),
						   	width => (others => '0')),
					gp =>  (	x => (others => '0'),
						   	y => (others => '0')),
					primary_color => (others => '0'),
	 				secondary_color => (others => '0'),
					bdt => (others => (others => (others => '0'))),
					bbe => (	maskop => (others => '0'),
						   	mask => (others => '0')),
					curr_out_addr => (others => '0')
				  );
	shared variable vram : vram_t;
	signal N : integer := 0;
	shared variable n_seq : integer := 0;
	shared variable seq_count : integer := 0;
	shared variable seq : boolean := false;
	shared variable wait_op : integer range 0 to 2 := 0;
	shared variable operands : operands_t := (others => (others => '0'));
	shared variable op_idx : integer range 0 to 4 := 0;
	shared variable operands_needed : integer := 0;
	signal command : std_logic_vector(GFX_CMD_WIDTH-1 downto 0);

	function get_addr(	base : in unsigned(20 downto 0);
				width : in unsigned(14 downto 0);
				x : in integer;
				y : in integer) return std_logic_vector is
	begin
		return std_logic_vector(signed(base) + y * signed(width) + x);
	end function;
	
	function transform(	color : in std_logic_vector(7 downto 0);
				mask : in std_logic_vector(7 downto 0);
				maskop : in std_logic_vector(1 downto 0)) return std_logic_vector is
	begin
		case maskop is
			when "00" => return color;
			when "01" => return color and mask;
			when "10" => return color or mask;
			when "11" => return color xor mask;
			when others => -- invalid --
		end case;
	end function;

	procedure vram_read(	addr : in natural;
				signal gfx_rd_data: out std_logic_vector(15 downto 0);
				signal gfx_rd_valid: out std_logic;
				m : in std_logic;
				vram : inout vram_t) is
	begin
		if (m = '0') then 
			gfx_rd_data(15 downto 8) <= (others => '0');
			gfx_rd_data(7 downto 0) <= vram.get_byte(addr);
		else
			gfx_rd_data <= vram.get_word(addr);
		end if;
		gfx_rd_valid <= '1';
	end procedure;
	
	procedure vram_write(	addr : in natural;
				m : in std_logic;
				data : in std_logic_vector(15 downto 0);
				vram : inout vram_t) is
	begin
		if (m = '0') then 
			vram.set_byte(addr, data(7 downto 0));
		else
			vram.set_word(addr, data);
		end if;
	end procedure;

	procedure vram_write_init(	addr : in natural;
					n : in integer;
					m : in std_logic;
					data : in std_logic_vector(15 downto 0);
					vram : inout vram_t) is
	begin
		if (m = '0') then 
			for i in 0 to n - 1 loop
				vram_write(addr + i, '0', data, vram);
			end loop;
		else
			for i in 0 to n - 1 loop
				vram_write(addr + 2 * i, '1', data, vram);
			end loop;
		end if;
	end procedure;
		
	procedure define_bmp(	signal state: inout state_t;
				addr : in natural;
				bmpidx : in integer;
				width : in unsigned(14 downto 0);
				height : in unsigned(14 downto 0)) is
	begin
		state.bdt(bmpidx).base <= to_unsigned(addr, 21);
		state.bdt(bmpidx).width <= width;
		state.bdt(bmpidx).height <= height;
		
	end procedure;
	
	procedure activ_bmp(	signal state: inout state_t;
				bmpidx : in integer) is
	begin
		state.abd <= state.bdt(bmpidx);
		
	end procedure;

	procedure display_bmp(	signal state: inout state_t;
				fs : in std_logic;
				bmpidx : in integer;
				signal gfx_frame_sync: out std_logic;
				signal N : inout integer) is
				
	begin
		state.curr_out_addr <= std_logic_vector(state.bdt(bmpidx).base);
		if (fs = '1') then
			gfx_frame_sync <= '1';
		end if;
		vram.dump_bitmap(to_integer(state.bdt(bmpidx).base), to_integer(state.bdt(bmpidx).width), 
		to_integer(state.bdt(bmpidx).height), "./" & integer'image(N) & ".ppm");
		N <= N + 1;
		
	end procedure;

	procedure move_gp(	signal state: inout state_t;
				rel : in std_logic;
				x : in std_logic_vector(15 downto 0);
				y : in std_logic_vector(15 downto 0)) is
				
	begin
		
		if (rel = '1') then
			state.gp.x <= state.gp.x + signed(x);
			state.gp.y <= state.gp.y + signed(y);
		else
			state.gp.x <= signed(x);
			state.gp.y <= signed(y);
		end if;
		
	end procedure;

	procedure inc_gp(	signal state: inout state_t;
				dir : in std_logic;
				incvalue : in std_logic_vector(9 downto 0)) is
					
	begin
		if (dir = '1') then
			state.gp.y <= state.gp.y + signed(incvalue);
		else
			state.gp.x <= state.gp.x + signed(incvalue);
		end if;
		
	end procedure;

	procedure clear(	signal state: inout state_t;
				cs : in std_logic; 
				vram : inout vram_t) is

		variable color : std_logic_vector(7 downto 0);	
		variable addr : natural;
	begin
		
		if (cs = '0') then
			color := state.primary_color;
		else
			color := state.secondary_color;
		end if;
		
		for i in 0 to to_integer(state.abd.width) loop
			for j in 0 to to_integer(state.abd.height) loop
				addr := to_integer(unsigned(get_addr(state.abd.base, state.abd.width,
					i, j)));
				vram_write(addr, '0', "00000000" & color, vram);
			end loop;
		end loop;

	end procedure;

	procedure set_pixel(	signal state: inout state_t;
				cs : in std_logic;
				my : in std_logic;
				mx : in std_logic; 
				vram : inout vram_t) is
					
		variable color : std_logic_vector(7 downto 0);	
		variable addr : natural;
	begin
		if (cs = '0') then
			color := state.primary_color;
		else
			color := state.secondary_color;
		end if;
		
		if (	(to_integer(state.gp.x) >= 0) and
			(to_integer(state.gp.y) >= 0) and 
			(to_integer(state.gp.x) < state.abd.width) and
			(to_integer(state.gp.y) < state.abd.height)	) then
				addr := to_integer(unsigned(get_addr(state.abd.base, state.abd.width, 
				to_integer(state.gp.x), to_integer(state.gp.y))));
				vram_write(addr, '0', "00000000" & color, vram);
		end if;
		
		if (mx = '1') then
			state.gp.x <= state.gp.x + 1;
		end if;
		if (my = '1') then
			state.gp.y <= state.gp.y + 1;
		end if;
		
	end procedure;

	procedure draw_hline(	signal state: inout state_t;
				cs : in std_logic;
				my : in std_logic;
				mx : in std_logic;
				dx : in signed(15 downto 0);
				vram : inout vram_t) is
					
		variable color : std_logic_vector(7 downto 0);	
		variable addr : natural;
	begin
		if (cs = '0') then
			color := state.primary_color;
		else
			color := state.secondary_color;
		end if;
		
		if (to_integer(dx) >= 0) then
			for i in 0 to to_integer(dx) loop
				if (	(to_integer(state.gp.x) + i >= 0) and
					(to_integer(state.gp.y) >= 0) and 
					(to_integer(state.gp.x) + i < state.abd.width) and
					(to_integer(state.gp.y) < state.abd.height)	) then
						addr := to_integer(unsigned(get_addr(state.abd.base, state.abd.width, 
						to_integer(state.gp.x + i), to_integer(state.gp.y))));
						vram_write(addr, '0', "00000000" & color, vram);
				end if;
			end loop;
		else
			for i in 0 to abs(to_integer(dx)) loop
				if (	(to_integer(state.gp.x) - i >= 0) and
					(to_integer(state.gp.y) >= 0) and 
					(to_integer(state.gp.x) - i < state.abd.width) and
					(to_integer(state.gp.y) < state.abd.height)	) then
						addr := to_integer(unsigned(get_addr(state.abd.base, state.abd.width, 
						to_integer(state.gp.x - i), to_integer(state.gp.y))));
						vram_write(addr, '0', "00000000" & color, vram);
				end if;
			end loop;
		end if;
		
		if (mx = '1') then
			state.gp.x <= state.gp.x + dx;
		end if;
		if (my = '1') then
			state.gp.y <= state.gp.y + 1;
		end if;
		
	end procedure;

	procedure draw_vline(	signal state: inout state_t;
				cs : in std_logic;
				my : in std_logic;
				mx : in std_logic;
				dy : in signed(15 downto 0);
				vram : inout vram_t) is
					
		variable color : std_logic_vector(7 downto 0);	
		variable addr : natural;
	begin
		if (cs = '0') then
			color := state.primary_color;
		else
			color := state.secondary_color;
		end if;
		
		if (to_integer(dy) >= 0) then
			for i in 0 to to_integer(dy) loop
				if (	(to_integer(state.gp.x) >= 0) and
					(to_integer(state.gp.y) + i >= 0) and 
					(to_integer(state.gp.x) < state.abd.width) and
					(to_integer(state.gp.y) + i < state.abd.height)	) then
						addr := to_integer(unsigned(get_addr(state.abd.base, state.abd.width, 
						to_integer(state.gp.x), to_integer(state.gp.y + i))));
						vram_write(addr, '0', "00000000" & color, vram);
				end if;
			end loop;
		else
			for i in 0 to abs(to_integer(dy)) loop
				if (	(to_integer(state.gp.x) >= 0) and
					(to_integer(state.gp.y) - i >= 0) and 
					(to_integer(state.gp.x) < state.abd.width) and
					(to_integer(state.gp.y) - i < state.abd.height)	) then
						addr := to_integer(unsigned(get_addr(state.abd.base, state.abd.width, 
						to_integer(state.gp.x), to_integer(state.gp.y - i))));
						vram_write(addr, '0', "00000000" & color, vram);
				end if;
			end loop;
		end if;
		if (mx = '1') then
			state.gp.x <= state.gp.x + 1;
		end if;
		if (my = '1') then
			state.gp.y <= state.gp.y + dy;
		end if;
		
	end procedure;

	procedure get_pixel(	signal state: inout state_t;
				my : in std_logic;
				mx : in std_logic; 
				signal gfx_rd_data: out std_logic_vector(15 downto 0);
				signal gfx_rd_valid: out std_logic;
				vram : inout vram_t) is

		variable addr : natural;
	begin
		if (	(to_integer(state.gp.x) >= 0) and
			(to_integer(state.gp.y) >= 0) and 
			(to_integer(state.gp.x) < state.abd.width) and
			(to_integer(state.gp.y) < state.abd.height)	) then
				addr := to_integer(unsigned(get_addr(state.abd.base, state.abd.width, 
				to_integer(state.gp.x), to_integer(state.gp.y))));
				vram_read(addr, gfx_rd_data, gfx_rd_valid, '0', vram);
		else
			gfx_rd_data <= "1111111111111111";
			gfx_rd_valid <= '1';
		end if;
		
		if (mx = '1') then
			state.gp.x <= state.gp.x + 1;
		end if;
		if (my = '1') then
			state.gp.y <= state.gp.y + 1;
		end if;
		
	end procedure;

	procedure set_color(	signal state: inout state_t;
				cs : in std_logic;
				color : in std_logic_vector(7 downto 0)) is
	begin
		if (cs = '0') then
			state.primary_color <= color;
		else
			state.secondary_color <= color;
		end if;
		
	end procedure;

	procedure set_bb_effect(	signal state: inout state_t;
					maskop : in std_logic_vector(1 downto 0);
					mask : in std_logic_vector(7 downto 0)) is
	begin
		state.bbe.mask <= mask;
		state.bbe.maskop <= maskop;
		
	end procedure;

	procedure bb_clip( 	signal state : inout state_t;
				am : in std_logic;
				rot : in std_logic_vector(1 downto 0);
				my : in std_logic;
				mx : in std_logic;
				bmpidx : in integer;
				x : in unsigned(14 downto 0);
				y : in unsigned(14 downto 0);
				width : in unsigned(14 downto 0);
				height : in unsigned(14 downto 0)) is
		variable dx, dy : unsigned(14 downto 0) := (others => '0');
		variable dest_x_off, dest_y_off, aux : integer;
		variable dest_x, dest_y, src_x, src_y : integer;

		variable src_addr, dest_addr : integer;
		variable src_color, dest_color : std_logic_vector(7 downto 0);
		variable transformed_sec_color : std_logic_vector(7 downto 0);
	begin
		
		for i in 0 to to_integer(width) - 1 loop
			for j in 0 to to_integer(height) - 1 loop
				if (unsigned(rot) = "10" or unsigned(rot) = "11") then
					dest_x_off := to_integer(width) - 1 - i;
				else
					dest_x_off := i;
				end if;
				if (unsigned(rot) = "01" or unsigned(rot) = "10") then
					dest_y_off := to_integer(height) - 1 - j;
				else
					dest_y_off := j;
				end if;
				if (unsigned(rot) = "01" or unsigned(rot) = "11") then
					aux := dest_x_off;
					dest_x_off := dest_y_off;
					dest_y_off := aux;
				end if;
				
				dest_x := to_integer(state.gp.x) + dest_x_off;
				dest_y := to_integer(state.gp.y) + dest_y_off;
				
				if (	(dest_x >= 0) and
					(dest_y >= 0) and 
					(dest_x < state.abd.width) and
					(dest_y < state.abd.height)	) then

					src_x := i + to_integer(x);
					src_y := j + to_integer(y);

					src_addr := to_integer(unsigned(
						get_addr(state.bdt(bmpidx).base, 
						state.bdt(bmpidx).width, src_x, src_y)));
					dest_addr := to_integer(unsigned( 
						get_addr(state.abd.base, 
						state.abd.width, dest_x, dest_y)));

					src_color := vram.get_byte(src_addr);
					dest_color := transform(src_color, state.bbe.mask, state.bbe.maskop);
					transformed_sec_color := 
						transform(state.secondary_color, state.bbe.mask, state.bbe.maskop);

					if ((am = '1') nand 
					(unsigned(dest_color) = unsigned(transformed_sec_color))) then
						vram_write(dest_addr, '0', "00000000" & dest_color, vram);
				
					end if;
				end if;
			end loop;
		end loop;
		
		if (mx = '1') then
			if (unsigned(rot) = "00" or unsigned(rot) = "10") then
				dx := width;
			else
				dx := height;
			end if;
		end if;
		if (my = '1') then
			if (unsigned(rot) = "00" or unsigned(rot) = "10") then
				dy := height;
			else
				dy := width;
			end if;
		end if;
		
		state.gp.x <= state.gp.x + signed(dx);
		state.gp.y <= state.gp.y + signed(dy);
	end procedure;
	
	procedure bb_full( 	signal state : inout state_t;
				am : in std_logic;
				rot : in std_logic_vector(1 downto 0);
				my : in std_logic;
				mx : in std_logic;
				bmpidx : in integer) is
	begin
		
		bb_clip(state, am, rot, my, mx, bmpidx, to_unsigned(0, 15), to_unsigned(0, 15), 
			state.bdt(bmpidx).width, state.bdt(bmpidx).height);
	end procedure;

	procedure bb_char( 	signal state : inout state_t;
				am : in std_logic;
				rot : in std_logic_vector(1 downto 0);
				my : in std_logic;
				mx : in std_logic;
				bmpidx : in integer;
				xoffset : in unsigned(9 downto 0);
				charwidth : in unsigned(5 downto 0)) is
	begin
		
		bb_clip(state, am, rot, my, mx, bmpidx, "00000"&xoffset, to_unsigned(0, 15), 
			"000000000"&charwidth, state.bdt(bmpidx).height);
	end procedure;

	procedure exec_simple_cmd(	signal state: inout state_t;
					command : std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
					signal gfx_rd_data: out std_logic_vector(15 downto 0);
					signal gfx_rd_valid: out std_logic;
					signal gfx_frame_sync : out std_logic;
					vram : inout vram_t;
					signal N : inout integer) is
		variable code : opcode_t;
	begin
		code := get_opcode(command);
		case code is
			when OPCODE_INC_GP => 

				inc_gp(state, command(10), command(9 downto 0));

			when OPCODE_CLEAR => 

				clear(state, command(10), vram);

			when OPCODE_SET_PIXEL => 

				set_pixel(state, command(10), command(5), command(4), vram);

			when OPCODE_GET_PIXEL => 

				get_pixel(state, command(5), command(4), gfx_rd_data, gfx_rd_valid, vram);

			when OPCODE_SET_COLOR => 

				set_color(state, command(10), command(7 downto 0));

			when OPCODE_ACTIVATE_BMP => 

				activ_bmp(state, to_integer(unsigned(command(2 downto 0))));

			when OPCODE_DISPLAY_BMP => 

				display_bmp(state, command(10), to_integer(unsigned(command(2 downto 0))),
				gfx_frame_sync, N);

			when OPCODE_BB_FULL =>
				
				bb_full(state, command(10), command(9 downto 8), command(5),
				command(4), to_integer(unsigned(command(2 downto 0))));

			when OPCODE_SET_BB_EFFECT => 

				set_bb_effect(state, command(9 downto 8), command(7 downto 0));

			when others => -- error --
		end case;
	end procedure;

	procedure exec_cmd(	signal state: inout state_t;
				command : std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
				operands : operands_t;
				signal gfx_rd_data: out std_logic_vector(15 downto 0);
				signal gfx_rd_valid: out std_logic;
				vram : inout vram_t) is
		variable code : opcode_t;
	begin
		code := get_opcode(command);
		case code is
			when OPCODE_VRAM_READ => 

				vram_read(to_integer(unsigned(std_logic_vector'(operands(1)(4 downto 0)
					& operands(0)))), gfx_rd_data, gfx_rd_valid, command(0), vram);

			when OPCODE_VRAM_WRITE => 

				vram_write(to_integer(unsigned(std_logic_vector'(operands(1)(4 downto 0)
					& operands(0)))), command(0), operands(2), vram);

			when OPCODE_VRAM_WRITE_INIT =>

				vram_write_init(to_integer(unsigned(std_logic_vector'(operands(2)(4 downto 0)
					& operands(1)))), to_integer(unsigned(operands(0))), command(0), 
					operands(3), vram);

			when OPCODE_DEFINE_BMP =>

				define_bmp(state, to_integer(unsigned(std_logic_vector'(operands(1)(4 downto 0)
					& operands(0)))), to_integer(unsigned(command(2 downto 0))), 
					unsigned(operands(2)(14 downto 0)), unsigned(operands(3)(14 downto 0)));

			when OPCODE_MOVE_GP =>

				move_gp(state, command(2), operands(0), operands(1));

			when OPCODE_DRAW_HLINE => 

				draw_hline(state, command(10), command(5), command(4), signed(operands(0)), vram);

			when OPCODE_DRAW_VLINE => 

				draw_vline(state, command(10), command(5), command(4), signed(operands(0)), vram);

			when OPCODE_BB_CHAR => 

				bb_char(state, command(10), command(9 downto 8), command(5),
					command(4), to_integer(unsigned(command(2 downto 0))), 
					unsigned(operands(0)(15 downto 6)), unsigned(operands(0)(5 downto 0)));

			when OPCODE_BB_CLIP => 

				bb_clip(state, command(10), command(9 downto 8), command(5),
					command(4), to_integer(unsigned(command(2 downto 0))),
					unsigned(operands(0)(14 downto 0)),
					unsigned(operands(1)(14 downto 0)),
					unsigned(operands(2)(14 downto 0)),
					unsigned(operands(3)(14 downto 0)));

			when others => -- error --
		end case;
	end procedure;

begin

	init_vram : process
	begin
		vram.init(21);
		wait;
	end process;

	execute : process(clk)
	begin
		if (rising_edge(clk)) then
			gfx_rd_valid <= '0';
			gfx_frame_sync <= '0';
			if (gfx_cmd_wr = '1') then
				if (wait_op = 0) then
					command <= gfx_cmd;
					operands_needed := get_operands_count(get_opcode(gfx_cmd));
					if (operands_needed = 0) then
						exec_simple_cmd(state, gfx_cmd, gfx_rd_data,
								gfx_rd_valid, gfx_frame_sync, vram, N);
					elsif (operands_needed = -1) then
						wait_op := 2;
					else
						wait_op := 1;
					end if;
				elsif (wait_op = 1) then
					operands(op_idx) := gfx_cmd;
					op_idx := op_idx + 1;
					operands_needed := operands_needed - 1;
					if (operands_needed = 0) then
						exec_cmd(state, command, operands, gfx_rd_data,
								gfx_rd_valid, vram);
						operands := (others => (others => '0'));
						op_idx := 0;
						wait_op := 0;
					end if;
				else 
					if (seq = true) then
						vram_write(to_integer(unsigned(std_logic_vector'
						(operands(1)(4 downto 0) & operands(0)))) + seq_count, command(0),
						gfx_cmd, vram);
						if (command(0) = '0') then
							seq_count := seq_count + 1;
						else
							seq_count := seq_count + 2;
						end if;
						n_seq := n_seq - 1;
						if (n_seq = 0) then
							operands := (others => (others => '0'));
							op_idx := 0;
							wait_op := 0;
							seq := false;
							n_seq := -1;
							seq_count := 0;
						end if;
					else
						if (operands_needed = -1) then
							n_seq := to_integer(unsigned(gfx_cmd));
							operands_needed := 2;
						else
							operands(op_idx) := gfx_cmd;
							op_idx := op_idx + 1;
							operands_needed := operands_needed - 1;
							if (operands_needed = 0) then
								seq := true;
							end if;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;

end architecture;
