library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pkg.all;
use work.op_pkg.all;
use work.mem_pkg.all;

entity fetch is
	port (
		clk        : in  std_logic;
		res_n      : in  std_logic;
		stall      : in  std_logic;
		flush      : in  std_logic;

		-- to control
		mem_busy   : out std_logic;

		pcsrc      : in  std_logic;
		pc_in      : in  pc_type;
		pc_out     : out pc_type := (others => '0');
		instr      : out instr_type;

		-- memory controller interface
		mem_out   : out mem_out_type;
		mem_in    : in  mem_in_type
	);
end entity;

architecture rtl of fetch is
	signal pc_register : pc_type := ZERO_PC;
begin

	logic : process(clk, res_n)
	begin
		if (res_n = '0') then
			pc_register <= ZERO_PC;
			
		elsif rising_edge(clk) then
			if stall = '0' then
				if pcsrc = '1' then
					pc_register <= pc_in;
				else
					pc_register <= std_logic_vector(unsigned(pc_register) + 4);
				end if;
			end if;

			if flush = '1' then
				instr <= NOP_INST;
			else
				instr <= mem_in.rddata(INSTR_WIDTH-1 downto 0);
			end if;
		end if;
	end process;

	mem_busy <= mem_in.busy;
	pc_out <= pc_register;
	mem_out <= MEM_OUT_NOP;

end architecture;
