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
		pc_out     : out pc_type;
		instr      : out instr_type;

		-- memory controller interface
		mem_out   : out mem_out_type;
		mem_in    : in  mem_in_type
	);
end entity;

architecture rtl of fetch is
	signal pc_next : pc_type;
	signal instr_nop : std_logic;
	signal fetch_stall : std_logic;
	signal first : std_logic;
begin

	logic : process(clk, res_n)
	begin
		if res_n = '0' then
			pc_out <= std_logic_vector(to_signed(-4, PC_WIDTH));
			instr_nop <= '1';
			first <= '1';
		elsif rising_edge(clk) then
			first <= '0';
			if flush = '1' then
				instr_nop <= '1';
			else 
				if fetch_stall = '0' then
					instr_nop <= '0';
					pc_out <= pc_next;
				end if;
			end if;
		end if;
	end process;

	fetch_output : process(all)
	begin
		mem_out.rd <= not stall;
		mem_out.wr <= '0';
		mem_out.address <= pc_next(PC_WIDTH - 1 downto 2);

		if instr_nop = '0' then
			instr <= mem_in.rddata(7 downto 0) & mem_in.rddata(15 downto 8) & mem_in.rddata(23 downto 16) & mem_in.rddata(31 downto 24);
		else
			instr <= NOP_INST;
		end if;

		pc_next <= pc_out;
		if fetch_stall = '0' then
			if pcsrc = '1' then
				pc_next <= pc_in;
			else
				pc_next <= std_logic_vector(unsigned(pc_out) + 4);
			end if;
		end if;
	end process;

	mem_busy <= mem_in.busy;

	mem_out.wrdata <= (others => '0');
	mem_out.byteena <= (others => '1');

	fetch_stall <= stall and (not first);
	
end architecture;
