
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dualshock_pkg.all;

entity dualshock_ctrl is
	generic (
		CLK_FREQ : natural := 50_000_000;
		DS_CLK_FREQ : natural := 250_000;
		REFRESH_TIMEOUT : natural := 500_000;
		BIT_TIME : natural := 200
	);
	port (
		clk   : in std_logic;
		res_n : in std_logic;

		-- external interface to the DualShock controller
		ds_clk  : out std_logic;
		ds_cmd  : out std_logic;
		ds_data : in  std_logic;
		ds_att  : out std_logic;
		ds_ack  : in  std_logic;

		-- internal interface
		ctrl_data : out dualshock_t;
		big_motor   : in std_logic_vector(7 downto 0);
		small_motor : in std_logic
	);
end entity;


architecture arch of dualshock_ctrl is

	function reverse_vector (vec : std_logic_vector) return std_logic_vector is
		variable res : std_logic_vector(7 downto 0);
	begin
		res(0) := vec(vec'high - 0);
		res(1) := vec(vec'high - 1);
		res(2) := vec(vec'high - 2);
		res(3) := vec(vec'high - 3);
		res(4) := vec(vec'high - 4);
		res(5) := vec(vec'high - 5);
		res(6) := vec(vec'high - 6);
		res(7) := vec(vec'high - 7);

		return res;
	end function;

	type fsm_state_t is (
		PACKET_TIMEOUT, ATTENTION, WAIT_TIMEOUT, SET_COMMAND, CLK_LOW, CLK_HIGH, WAIT_ACK, WAIT_BEFORE_NEXT_BYTE, SAMPLE
	);

	type ctrl_mode_t is (
		DIGITAL, ANALOG, CONFIG
	);

	type state_t is record
		fsm_state : fsm_state_t;
		cmd_type : std_logic_vector(2 downto 0);
		ctrl_data_buffer : dualshock_t;
		clk_cnt : std_logic_vector(20 downto 0);
		bit_cnt : std_logic_vector(2 downto 0);
		byte_cnt : std_logic_vector(3 downto 0);
		ctrl_data_shift_reg : std_logic_vector(47 downto 0);
		cmd : std_logic_vector(7 downto 0);
		ctrl_mode : ctrl_mode_t;
		bytes_total : std_logic_vector(3 downto 0);
		mode_and_bytes_shift_reg : std_logic_vector(7 downto 0);
		updated : std_logic;
	end record;

	constant RESET_STATE : state_t := (
		fsm_state => PACKET_TIMEOUT,
		ctrl_data_buffer => DUALSHOCK_RST,
		ctrl_mode => DIGITAL,
		updated => '0',
		others => (others => '0')
	);

	signal state, state_nxt : state_t := RESET_STATE;
begin

	state_register : process(clk, res_n)
	begin
		if (res_n = '0') then
			state <= RESET_STATE;
		elsif (rising_edge(clk)) then
			state <= state_nxt;
		end if;
	end process;

	next_state_logic : process(all)
	begin

		state_nxt <= state;
		ctrl_data <= state.ctrl_data_buffer;

		case state.fsm_state is

			when PACKET_TIMEOUT =>

				if (to_integer(unsigned(state.clk_cnt)) = REFRESH_TIMEOUT) then
					state_nxt.fsm_state <= ATTENTION;
					state_nxt.clk_cnt <= (others => '0');
				else
					state_nxt.clk_cnt <= std_logic_vector(unsigned(state.clk_cnt) + 1);
				end if;

				if ((state.ctrl_mode = DIGITAL or state.ctrl_mode = CONFIG) and state.updated = '1') then
					state_nxt.ctrl_data_buffer.square <= not state.ctrl_data_shift_reg(0);
					state_nxt.ctrl_data_buffer.cross <= not state.ctrl_data_shift_reg(1);
					state_nxt.ctrl_data_buffer.circle <= not state.ctrl_data_shift_reg(2);
					state_nxt.ctrl_data_buffer.triangle <= not state.ctrl_data_shift_reg(3);
					state_nxt.ctrl_data_buffer.r1 <= not state.ctrl_data_shift_reg(4);
					state_nxt.ctrl_data_buffer.l1 <= not state.ctrl_data_shift_reg(5);
					state_nxt.ctrl_data_buffer.r2 <= not state.ctrl_data_shift_reg(6);
					state_nxt.ctrl_data_buffer.l2 <= not state.ctrl_data_shift_reg(7);
					state_nxt.ctrl_data_buffer.left <= not state.ctrl_data_shift_reg(8);
					state_nxt.ctrl_data_buffer.down <= not state.ctrl_data_shift_reg(9);
					state_nxt.ctrl_data_buffer.right <= not state.ctrl_data_shift_reg(10);
					state_nxt.ctrl_data_buffer.up <= not state.ctrl_data_shift_reg(11);
					state_nxt.ctrl_data_buffer.start <= not state.ctrl_data_shift_reg(12);
					state_nxt.ctrl_data_buffer.r3 <= not state.ctrl_data_shift_reg(13);
					state_nxt.ctrl_data_buffer.l3 <= not state.ctrl_data_shift_reg(14);
					state_nxt.ctrl_data_buffer.sel <= not state.ctrl_data_shift_reg(15);

					state_nxt.updated <= '0';

				elsif (state.ctrl_mode = ANALOG and state.updated = '1') then

					state_nxt.ctrl_data_buffer.ls_y <= 
						std_logic_vector(unsigned(reverse_vector(state.ctrl_data_shift_reg(7 downto 0))));
					state_nxt.ctrl_data_buffer.ls_x <= 
						std_logic_vector(unsigned(reverse_vector(state.ctrl_data_shift_reg(15 downto 8))));
					state_nxt.ctrl_data_buffer.rs_y <= 
						std_logic_vector(unsigned(reverse_vector(state.ctrl_data_shift_reg(23 downto 16))));
					state_nxt.ctrl_data_buffer.rs_x <= 
						std_logic_vector(unsigned(reverse_vector(state.ctrl_data_shift_reg(31 downto 24))));

					state_nxt.ctrl_data_buffer.square <= not state.ctrl_data_shift_reg(32);
					state_nxt.ctrl_data_buffer.cross <= not state.ctrl_data_shift_reg(33);
					state_nxt.ctrl_data_buffer.circle <= not state.ctrl_data_shift_reg(34);
					state_nxt.ctrl_data_buffer.triangle <= not state.ctrl_data_shift_reg(35);
					state_nxt.ctrl_data_buffer.r1 <= not state.ctrl_data_shift_reg(36);
					state_nxt.ctrl_data_buffer.l1 <= not state.ctrl_data_shift_reg(37);
					state_nxt.ctrl_data_buffer.r2 <= not state.ctrl_data_shift_reg(38);
					state_nxt.ctrl_data_buffer.l2 <= not state.ctrl_data_shift_reg(39);
					state_nxt.ctrl_data_buffer.left <= not state.ctrl_data_shift_reg(40);
					state_nxt.ctrl_data_buffer.down <= not state.ctrl_data_shift_reg(41);
					state_nxt.ctrl_data_buffer.right <= not state.ctrl_data_shift_reg(42);
					state_nxt.ctrl_data_buffer.up <= not state.ctrl_data_shift_reg(43);
					state_nxt.ctrl_data_buffer.start <= not state.ctrl_data_shift_reg(44);
					state_nxt.ctrl_data_buffer.r3 <= not state.ctrl_data_shift_reg(45);
					state_nxt.ctrl_data_buffer.l3 <= not state.ctrl_data_shift_reg(46);
					state_nxt.ctrl_data_buffer.sel <= not state.ctrl_data_shift_reg(47);

					state_nxt.updated <= '0';

				end if;

				ds_clk <= '1';
				ds_att <= '1';
				ds_cmd <= '1';

			when ATTENTION =>

				ds_clk <= '1';
				ds_att <= '0';
				ds_cmd <= '1';

				state_nxt.fsm_state <= WAIT_TIMEOUT;

			when WAIT_TIMEOUT =>

				if (to_integer(unsigned(state.clk_cnt)) = 8 * BIT_TIME) then
					state_nxt.fsm_state <= SET_COMMAND;
					state_nxt.clk_cnt <= (others => '0');
				else
					state_nxt.clk_cnt <= std_logic_vector(unsigned(state.clk_cnt) + 1);
				end if;

				ds_clk <= '1';
				ds_att <= '0';
				ds_cmd <= '1';

			when SET_COMMAND =>
				
				case state.cmd_type is 

					when "000" => -- ENTER CONFIG
						case to_integer(unsigned(state.byte_cnt)) is
							
							when 0 => state_nxt.cmd <= "00000001";
							when 1 => state_nxt.cmd <= "01000011";
							when 3 => state_nxt.cmd <= "00000001";
							when others => state_nxt.cmd <= "00000000";

						end case;

					when "001" => -- ACTIVATE ANALOG
						case to_integer(unsigned(state.byte_cnt)) is
								
							when 0 => state_nxt.cmd <= "00000001";
							when 1 => state_nxt.cmd <= "01000100";
							when 3 => state_nxt.cmd <= "00000001";
							when 4 => state_nxt.cmd <= "00000011";
							when others => state_nxt.cmd <= "00000000";

						end case;

					when "010" => -- ENABLE MOTOR
						case to_integer(unsigned(state.byte_cnt)) is
								
							when 0 => state_nxt.cmd <= "00000001";
							when 1 => state_nxt.cmd <= "01001101";
							when 4 => state_nxt.cmd <= "00000001";
							when 5 => state_nxt.cmd <= "11111111";
							when 6 => state_nxt.cmd <= "11111111";
							when 7 => state_nxt.cmd <= "11111111";
							when 8 => state_nxt.cmd <= "11111111";
							when others => state_nxt.cmd <= "00000000";

						end case;

					when "011" => -- EXIT CONFIG
						case to_integer(unsigned(state.byte_cnt)) is
								
							when 0 => state_nxt.cmd <= "00000001";
							when 1 => state_nxt.cmd <= "01000011";
							when 4 => state_nxt.cmd <= "01011010";
							when 5 => state_nxt.cmd <= "01011010";
							when 6 => state_nxt.cmd <= "01011010";
							when 7 => state_nxt.cmd <= "01011010";
							when 8 => state_nxt.cmd <= "01011010";
							when others => state_nxt.cmd <= "00000000";

						end case;

					when "100" => -- MAIN POLL
						case to_integer(unsigned(state.byte_cnt)) is
								
							when 0 => state_nxt.cmd <= "00000001";
							when 1 => state_nxt.cmd <= "01000010";
							when 3 => 
								if (small_motor = '1') then
									state_nxt.cmd <= x"ff";
								else
									state_nxt.cmd <= x"00";
								end if;
							when 4 => 
								state_nxt.cmd <= big_motor;
							when others => state_nxt.cmd <= "00000000";

						end case;

					when others => -- invalid
						
				end case;

				state_nxt.fsm_state <= CLK_LOW;

				ds_clk <= '1';
				ds_att <= '0';
				ds_cmd <= '0';

			when CLK_LOW =>

				if (to_integer(unsigned(state.clk_cnt)) = BIT_TIME / 2) then
					state_nxt.fsm_state <= SAMPLE;
					state_nxt.clk_cnt <= (others => '0');
				else
					state_nxt.clk_cnt <= std_logic_vector(unsigned(state.clk_cnt) + 1);
				end if;
				
				ds_clk <= '0';
				ds_att <= '0';
				ds_cmd <= state.cmd(to_integer(unsigned(state.bit_cnt)));

			when SAMPLE =>
				
				if (state.cmd_type = "000" or state.cmd_type = "100") then
					if (to_integer(unsigned(state.byte_cnt)) > 2) then
						state_nxt.ctrl_data_shift_reg <= state.ctrl_data_shift_reg(46 downto 0) & ds_data;
					end if;
				end if;

				if (to_integer(unsigned(state.byte_cnt)) = 1) then
					state_nxt.mode_and_bytes_shift_reg <= state.mode_and_bytes_shift_reg(6 downto 0) & ds_data;
				end if;

				ds_clk <= '1';
				ds_att <= '0';
				ds_cmd <= state.cmd(to_integer(unsigned(state.bit_cnt)));

				state_nxt.fsm_state <= CLK_HIGH;

			when CLK_HIGH =>	

				if (to_integer(unsigned(state.clk_cnt)) = BIT_TIME / 2) then

					if (to_integer(unsigned(state.bit_cnt)) = 7) then

						if (to_integer(unsigned(state.byte_cnt)) >= 3 and unsigned(state.byte_cnt) = unsigned(state.bytes_total) + 2) then
							state_nxt.fsm_state <= WAIT_BEFORE_NEXT_BYTE;
						else
							state_nxt.fsm_state <= WAIT_ACK;
						end if;
						state_nxt.bit_cnt <= (others => '0');

						state_nxt.byte_cnt <= std_logic_vector(unsigned(state.byte_cnt) + 1);
					else
						state_nxt.bit_cnt <= std_logic_vector(unsigned(state.bit_cnt) + 1);
						state_nxt.fsm_state <= CLK_LOW;
					end if;

					state_nxt.clk_cnt <= (others => '0');
				else
					state_nxt.clk_cnt <= std_logic_vector(unsigned(state.clk_cnt) + 1);
				end if;
				
				ds_clk <= '1';
				ds_att <= '0';
				ds_cmd <= state.cmd(to_integer(unsigned(state.bit_cnt)));

			when WAIT_ACK =>

				if (to_integer(unsigned(state.clk_cnt)) = 4 * BIT_TIME) then -- 12 us = 3 * BIT_TIME, wait an extra cycle for good measure
					state_nxt <= RESET_STATE;
				else
					state_nxt.clk_cnt <= std_logic_vector(unsigned(state.clk_cnt) + 1);
				end if;
					
				if (ds_ack = '0') then
					state_nxt.fsm_state <= WAIT_BEFORE_NEXT_BYTE;
					state_nxt.clk_cnt <= (others => '0');
				end if;

				if (to_integer(unsigned(state.byte_cnt)) = 2) then
					
					case state.mode_and_bytes_shift_reg(3 downto 0) is
						
						when "0010" => state_nxt.ctrl_mode <= DIGITAL;
						when "1110" => state_nxt.ctrl_mode <= ANALOG;
						when "1111" => state_nxt.ctrl_mode <= CONFIG;
						when others =>

					end case;

					case state.mode_and_bytes_shift_reg(7 downto 4) is
						
						when "1000" => state_nxt.bytes_total <= std_logic_vector(to_unsigned(2, 4));
						when "1100" => state_nxt.bytes_total <= std_logic_vector(to_unsigned(6, 4));
						when others =>

					end case;
				end if;

				ds_clk <= '1';
				ds_att <= '0';
				ds_cmd <= '0';

			when WAIT_BEFORE_NEXT_BYTE =>
				
				if (to_integer(unsigned(state.clk_cnt)) = BIT_TIME) then

					if (to_integer(unsigned(state.byte_cnt)) >= 3 and unsigned(state.byte_cnt) = unsigned(state.bytes_total) + 3) then
						state_nxt.byte_cnt <= (others => '0');
						state_nxt.fsm_state <= PACKET_TIMEOUT;
						state_nxt.bytes_total <= (others => '0');

						if (to_integer(unsigned(state.cmd_type)) < 4) then
							state_nxt.cmd_type <= std_logic_vector(unsigned(state.cmd_type) + 1);
						end if;

						if (to_integer(unsigned(state.cmd_type)) = 0 or to_integer(unsigned(state.cmd_type)) = 4) then
							state_nxt.updated <= '1';
						end if;

						ds_att <= '1';
					else
						ds_att <= '0';
						state_nxt.fsm_state <= SET_COMMAND;
					end if;

					state_nxt.clk_cnt <= (others => '0');
				else
					ds_att <= '0';
					state_nxt.clk_cnt <= std_logic_vector(unsigned(state.clk_cnt) + 1);
				end if;

				ds_clk <= '1';
				ds_cmd <= '0';
				
		end case;
	end process;

end architecture;
