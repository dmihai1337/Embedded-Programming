
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
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

package interpreter_pkg is

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

	function get_addr(	base : in unsigned(20 downto 0);
				width : in unsigned(14 downto 0);
				x : in integer;
				y : in integer) return std_logic_vector;
	function transform(	color : in std_logic_vector(7 downto 0);
				mask : in std_logic_vector(7 downto 0);
				maskop : in std_logic_vector(1 downto 0)) return std_logic_vector;
	procedure vram_read(	addr : in natural;
				signal gfx_rd_data: out std_logic_vector(15 downto 0);
				signal gfx_rd_valid: out std_logic;
				m : in std_logic;
				vram : inout vram_t);
	procedure vram_write(	addr : in natural;
				m : in std_logic;
				data : in std_logic_vector(15 downto 0);
				vram : inout vram_t);
	procedure vram_write_init(	addr : in natural;
					n : in integer;
					m : in std_logic;
					data : in std_logic_vector(15 downto 0);
					vram : inout vram_t);
	procedure define_bmp(	signal state: inout state_t;
				addr : in natural;
				bmpidx : in integer;
				width : in unsigned(14 downto 0);
				height : in unsigned(14 downto 0));
	procedure activ_bmp(	signal state: inout state_t;
				bmpidx : in integer);
	procedure display_bmp(	signal state: inout state_t;
				fs : in std_logic;
				bmpidx : in integer;
				signal gfx_frame_sync: out std_logic;
				signal N : inout integer;
				vram : inout vram_t);
	procedure move_gp(	signal state: inout state_t;
				rel : in std_logic;
				x : in std_logic_vector(15 downto 0);
				y : in std_logic_vector(15 downto 0));
	procedure inc_gp(	signal state: inout state_t;
				dir : in std_logic;
				incvalue : in std_logic_vector(9 downto 0));
	procedure clear(	signal state: inout state_t;
				cs : in std_logic; 
				vram : inout vram_t);
	procedure set_pixel(	signal state: inout state_t;
				cs : in std_logic;
				my : in std_logic;
				mx : in std_logic; 
				vram : inout vram_t);
	procedure draw_hline(	signal state: inout state_t;
				cs : in std_logic;
				my : in std_logic;
				mx : in std_logic;
				dx : in signed(15 downto 0);
				vram : inout vram_t);
	procedure draw_vline(	signal state: inout state_t;
				cs : in std_logic;
				my : in std_logic;
				mx : in std_logic;
				dy : in signed(15 downto 0);
				vram : inout vram_t);
	procedure get_pixel(	signal state: inout state_t;
				my : in std_logic;
				mx : in std_logic; 
				signal gfx_rd_data: out std_logic_vector(15 downto 0);
				signal gfx_rd_valid: out std_logic;
				vram : inout vram_t);
	procedure set_color(	signal state: inout state_t;
				cs : in std_logic;
				color : in std_logic_vector(7 downto 0));
	procedure set_bb_effect(	signal state: inout state_t;
					maskop : in std_logic_vector(1 downto 0);
					mask : in std_logic_vector(7 downto 0));
	procedure bb_clip( 	signal state : inout state_t;
				am : in std_logic;
				rot : in std_logic_vector(1 downto 0);
				my : in std_logic;
				mx : in std_logic;
				bmpidx : in integer;
				x : in unsigned(14 downto 0);
				y : in unsigned(14 downto 0);
				width : in unsigned(14 downto 0);
				height : in unsigned(14 downto 0);
				vram : inout vram_t);
	procedure bb_full( 	signal state : inout state_t;
				am : in std_logic;
				rot : in std_logic_vector(1 downto 0);
				my : in std_logic;
				mx : in std_logic;
				bmpidx : in integer;
				vram : inout vram_t);
	procedure bb_char( 	signal state : inout state_t;
				am : in std_logic;
				rot : in std_logic_vector(1 downto 0);
				my : in std_logic;
				mx : in std_logic;
				bmpidx : in integer;
				xoffset : in unsigned(9 downto 0);
				charwidth : in unsigned(5 downto 0);
				vram : inout vram_t);
end package;


package body interpreter_pkg is

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
				signal N : inout integer;
				vram : inout vram_t) is
				
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
		
		for i in 0 to to_integer(state.abd.width) - 1 loop
			for j in 0 to to_integer(state.abd.height) - 1 loop
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
				height : in unsigned(14 downto 0);
				vram : inout vram_t) is
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
				bmpidx : in integer;
				vram : inout vram_t) is
	begin
		
		bb_clip(state, am, rot, my, mx, bmpidx, to_unsigned(0, 15), to_unsigned(0, 15), 
			state.bdt(bmpidx).width, state.bdt(bmpidx).height, vram);
	end procedure;

	procedure bb_char( 	signal state : inout state_t;
				am : in std_logic;
				rot : in std_logic_vector(1 downto 0);
				my : in std_logic;
				mx : in std_logic;
				bmpidx : in integer;
				xoffset : in unsigned(9 downto 0);
				charwidth : in unsigned(5 downto 0);
				vram : inout vram_t) is
	begin
		
		bb_clip(state, am, rot, my, mx, bmpidx, "00000"&xoffset, to_unsigned(0, 15), 
			"000000000"&charwidth, state.bdt(bmpidx).height, vram);
	end procedure;
	
end package body;

