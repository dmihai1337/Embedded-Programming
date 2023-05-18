library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mem_pkg.all;
use work.core_pkg.all;
use work.op_pkg.all;

entity memu is
	port (
		-- to mem
		op   : in  memu_op_type;
		A    : in  data_type;
		W    : in  data_type;
		R    : out data_type := (others => '0');

		B    : out std_logic := '0';
		XL   : out std_logic := '0';
		XS   : out std_logic := '0';

		-- to memory controller
		D    : in  mem_in_type;
		M    : out mem_out_type := MEM_OUT_NOP
	);
end entity;

architecture rtl of memu is
begin

	logic : process(all)
	begin

		-- STORE EXCEPTION (XS) --

		if  (op.memwrite = '1' and op.memtype = MEM_H and A(1 downto 0) = "01") or
			(op.memwrite = '1' and op.memtype = MEM_H and A(1 downto 0) = "11") or
			(op.memwrite = '1' and op.memtype = MEM_HU and A(1 downto 0) = "01") or
			(op.memwrite = '1' and op.memtype = MEM_HU and A(1 downto 0) = "11") or
			(op.memwrite = '1' and op.memtype = MEM_W and A(1 downto 0) = "01") or
			(op.memwrite = '1' and op.memtype = MEM_W and A(1 downto 0) = "10") or
			(op.memwrite = '1' and op.memtype = MEM_W and A(1 downto 0) = "11") then
				XS <= '1';
		else
				XS <= '0';
		end if;

		-- LOAD EXCEPTION (XL) --

		if  (op.memread = '1' and op.memtype = MEM_H and A(1 downto 0) = "01") or
			(op.memread = '1' and op.memtype = MEM_H and A(1 downto 0) = "11") or
			(op.memread = '1' and op.memtype = MEM_HU and A(1 downto 0) = "01") or
			(op.memread = '1' and op.memtype = MEM_HU and A(1 downto 0) = "11") or
			(op.memread = '1' and op.memtype = MEM_W and A(1 downto 0) = "01") or
			(op.memread = '1' and op.memtype = MEM_W and A(1 downto 0) = "10") or
			(op.memread = '1' and op.memtype = MEM_W and A(1 downto 0) = "11") then
				XL <= '1';
		else
				XL <= '0';
		end if;

		-- RESULT OF MEMORY LOAD (R) --

		if op.memtype = MEM_W then

			R(31 downto 24) <= D.rddata(7 downto 0);
			R(23 downto 16) <= D.rddata(15 downto 8);
			R(15 downto 8) <= D.rddata(23 downto 16);
			R(7 downto 0) <= D.rddata(31 downto 24);

		elsif op.memtype = MEM_HU then

			R(31 downto 24) <= x"00";
			R(23 downto 16) <= x"00";

			if A(1 downto 0) = "00" or A(1 downto 0) = "01" then
				R(15 downto 8) <= D.rddata(23 downto 16);
				R(7 downto 0) <= D.rddata(31 downto 24);
			else
				R(15 downto 8) <= D.rddata(7 downto 0);
				R(7 downto 0) <= D.rddata(15 downto 8);
			end if;

		elsif op.memtype = MEM_BU then

			R(31 downto 24) <= x"00";
			R(23 downto 16) <= x"00";
			R(15 downto 8) <= x"00";

			if A(1 downto 0) = "00" then
				R(7 downto 0) <= D.rddata(31 downto 24);
			elsif A(1 downto 0) = "01" then
				R(7 downto 0) <= D.rddata(23 downto 16);
			elsif A(1 downto 0) = "10" then
				R(7 downto 0) <= D.rddata(15 downto 8);
			else
				R(7 downto 0) <= D.rddata(7 downto 0);
			end if;

		elsif op.memtype = MEM_B then

			if A(1 downto 0) = "00" then

				if D.rddata(31) = '1' then
					R(31 downto 24) <= x"FF";
					R(23 downto 16) <= x"FF";
					R(15 downto 8) <= x"FF";
				else
					R(31 downto 24) <= x"00";
					R(23 downto 16) <= x"00";
					R(15 downto 8) <= x"00";
				end if;

				R(7 downto 0) <= D.rddata(31 downto 24);

			elsif A(1 downto 0) = "01" then

				if D.rddata(23) = '1' then
					R(31 downto 24) <= x"FF";
					R(23 downto 16) <= x"FF";
					R(15 downto 8) <= x"FF";
				else
					R(31 downto 24) <= x"00";
					R(23 downto 16) <= x"00";
					R(15 downto 8) <= x"00";
				end if;

				R(7 downto 0) <= D.rddata(23 downto 16);

			elsif A(1 downto 0) = "10" then

				if D.rddata(15) = '1' then
					R(31 downto 24) <= x"FF";
					R(23 downto 16) <= x"FF";
					R(15 downto 8) <= x"FF";
				else
					R(31 downto 24) <= x"00";
					R(23 downto 16) <= x"00";
					R(15 downto 8) <= x"00";
				end if;

				R(7 downto 0) <= D.rddata(15 downto 8);

			else

				if D.rddata(7) = '1' then
					R(31 downto 24) <= x"FF";
					R(23 downto 16) <= x"FF";
					R(15 downto 8) <= x"FF";
				else
					R(31 downto 24) <= x"00";
					R(23 downto 16) <= x"00";
					R(15 downto 8) <= x"00";
				end if;

				R(7 downto 0) <= D.rddata(7 downto 0);

			end if;

		elsif op.memtype = MEM_H then

			if A(1 downto 0) = "00" or A(1 downto 0) = "01" then

				if D.rddata(23) = '1' then
					R(31 downto 24) <= x"FF";
					R(23 downto 16) <= x"FF";
				else
					R(31 downto 24) <= x"00";
					R(23 downto 16) <= x"00";
				end if;

				R(15 downto 8) <= D.rddata(23 downto 16);
				R(7 downto 0) <= D.rddata(31 downto 24);

			else

				if D.rddata(7) = '1' then
					R(31 downto 24) <= x"FF";
					R(23 downto 16) <= x"FF";
				else
					R(31 downto 24) <= x"00";
					R(23 downto 16) <= x"00";
				end if;

				R(15 downto 8) <= D.rddata(7 downto 0);
				R(7 downto 0) <= D.rddata(15 downto 8);

			end if;
			
		end if;

		-- INTERFACE FROM MEMORY (M) --

		if op.memtype = MEM_W then

			M.byteena <= "1111";
			M.wrdata(31 downto 24) <= W(7 downto 0);
			M.wrdata(23 downto 16) <= W(15 downto 8);
			M.wrdata(15 downto 8) <= W(23 downto 16);
			M.wrdata(7 downto 0) <= W(31 downto 24);

		elsif op.memtype = MEM_H xor op.memtype = MEM_HU then

			if A(1 downto 0) = "00" or A(1 downto 0) = "01" then
				M.byteena <= "1100";
				M.wrdata(31 downto 24) <= W(7 downto 0);
				M.wrdata(23 downto 16) <= W(15 downto 8);
				M.wrdata(15 downto 8) <= (others => '-');
				M.wrdata(7 downto 0) <= (others => '-');
			else
				M.byteena <= "0011";
				M.wrdata(31 downto 24) <= (others => '-');
				M.wrdata(23 downto 16) <= (others => '-');
				M.wrdata(15 downto 8) <= W(7 downto 0);
				M.wrdata(7 downto 0) <= W(15 downto 8);
			end if;

		elsif op.memtype = MEM_B xor op.memtype = MEM_BU then

			if A(1 downto 0) = "00" then

				M.byteena <= "1000";
				M.wrdata(31 downto 24) <= W(7 downto 0);
				M.wrdata(23 downto 16) <= (others => '-');
				M.wrdata(15 downto 8) <= (others => '-');
				M.wrdata(7 downto 0) <= (others => '-');

			elsif A(1 downto 0) = "01" then

				M.byteena <= "0100";
				M.wrdata(31 downto 24) <= (others => '-');
				M.wrdata(23 downto 16) <= W(7 downto 0);
				M.wrdata(15 downto 8) <= (others => '-');
				M.wrdata(7 downto 0) <= (others => '-');

			elsif A(1 downto 0) = "10" then

				M.byteena <= "0010";
				M.wrdata(31 downto 24) <= (others => '-');
				M.wrdata(23 downto 16) <= (others => '-');
				M.wrdata(15 downto 8) <= W(7 downto 0);
				M.wrdata(7 downto 0) <= (others => '-');

			else

				M.byteena <= "0001";
				M.wrdata(31 downto 24) <= (others => '-');
				M.wrdata(23 downto 16) <= (others => '-');
				M.wrdata(15 downto 8) <= (others => '-');
				M.wrdata(7 downto 0) <= W(7 downto 0);

			end if;

		end if;

		if XS = '1' or XL = '1' then
			M.rd <= '0';
			M.wr <= '0';
		else
			M.rd <= op.memread;
			M.wr <= op.memwrite;
		end if;

		M.address <= A(ADDR_WIDTH-1 downto 0);

		-- BUSY (B) --

		B <= D.busy or ((not (XS or XL)) and op.memread);
	
	end process;
	
end architecture;
