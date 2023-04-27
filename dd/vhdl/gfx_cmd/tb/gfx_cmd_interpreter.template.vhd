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
use work.interpreter_pkg.all;


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
				gfx_frame_sync, N, vram);

			when OPCODE_BB_FULL =>
				
				bb_full(state, command(10), command(9 downto 8), command(5),
				command(4), to_integer(unsigned(command(2 downto 0))), vram);

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
					unsigned(operands(0)(15 downto 6)), unsigned(operands(0)(5 downto 0)), vram);

			when OPCODE_BB_CLIP => 

				bb_clip(state, command(10), command(9 downto 8), command(5),
					command(4), to_integer(unsigned(command(2 downto 0))),
					unsigned(operands(0)(14 downto 0)),
					unsigned(operands(1)(14 downto 0)),
					unsigned(operands(2)(14 downto 0)),
					unsigned(operands(3)(14 downto 0)), vram);

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
						if (seq_count < 50) then
						end if;
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
