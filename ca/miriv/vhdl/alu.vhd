library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pkg.all;
use work.op_pkg.all;

-- ATTENTION: zero flag is only valid on SUB and SLT(U)

entity alu is
	port (
		op   : in  alu_op_type;
		A, B : in  data_type;
		R    : out data_type := (others => '0');
		Z    : out std_logic := '0'
	);
end alu;

architecture rtl of alu is
begin
	logic : process(all)
		variable calc_r : data_type;
	begin
		Z <= '-';
		case op is
			when ALU_NOP =>
				R <= B;
			when ALU_SLT =>
				--report "SLT: " & to_string(to_integer(signed(A)))  & " " & to_string(to_integer(signed(B)));
				if signed(A) < signed(B) then
					R <= (0 => '1', others => '0');
					Z <= '0';
				else
					R <= (others => '0');
					Z <= '1';
				end if;
			when ALU_SLTU =>
				if unsigned(A) < unsigned(B) then
					R <= (0 => '1', others => '0');
					Z <= '0';
				else
					R <= (others => '0');
					Z <= '1';
				end if;
			-- https://nandland.com/shift-left-shift-right/
			when ALU_SLL =>
				R <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
			when ALU_SRL =>
				R <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
			when ALU_SRA =>
				R <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(B(4 downto 0)))));
			when ALU_ADD =>
				R <= std_logic_vector(signed(A) + signed(B));
			when ALU_SUB =>
				R <= std_logic_vector(signed(A) - signed(B));
				if A = B then
					Z <= '1';
				else
					Z <= '0';
				end if;
			when ALU_AND =>
				R <= A and B;
			when ALU_OR =>
				R <= A or B;
			when ALU_XOR =>
				R <= A xor B;
			when others => report "ALU_OP_TYPE not implemented";
		end case;
	end process;
end architecture;
