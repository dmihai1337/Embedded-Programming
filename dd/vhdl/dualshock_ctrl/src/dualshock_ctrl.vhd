
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
	type fsm_state_t is (
		PACKET_TIMEOUT, ATTENTION, WAIT_TIMEOUT, SET_COMMAND, CLK_LOW, CLK_HIGH, WAIT_ACK, WAIT_BEFORE_NEXT_BYTE
	);

	type ctrl_mode_t is (
		DIGITAL, ANALOG, CONFIG
	);

	type state_t is record
		fsm_state : fsm_state_t;
		ctrl_data_buffer : dualshock_t;
		clk_cnt : std_logic_vector(20 downto 0);
		bit_cnt : std_logic_vector(2 downto 0);
		byte_cnt : std_logic_vector(3 downto 0);
		ctrl_data_shift_reg : std_logic_vector(48 downto 0);
		cmd : std_logic_vector(7 downto 0);
		ctrl_mode : ctrl_mode_t;
		bytes_total : std_logic_vector(3 downto 0);
		mode_and_bytes_shift_reg : std_logic_vector(7 downto 0);
	end record;

	constant RESET_STATE : state_t := (
		fsm_state => PACKET_TIMEOUT,
		ctrl_data_buffer => DUALSHOCK_RST,
		ctrl_mode => DIGITAL,
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

				if (state.ctrl_mode = DIGITAL) then
					state_nxt.ctrl_data_buffer.square <= state.ctrl_data_shift_reg(0);
					state_nxt.ctrl_data_buffer.cross <= state.ctrl_data_shift_reg(1);
					state_nxt.ctrl_data_buffer.circle <= state.ctrl_data_shift_reg(2);
					state_nxt.ctrl_data_buffer.triangle <= state.ctrl_data_shift_reg(3);
					state_nxt.ctrl_data_buffer.r1 <= state.ctrl_data_shift_reg(4);
					state_nxt.ctrl_data_buffer.l1 <= state.ctrl_data_shift_reg(5);
					state_nxt.ctrl_data_buffer.r2 <= state.ctrl_data_shift_reg(6);
					state_nxt.ctrl_data_buffer.l2 <= state.ctrl_data_shift_reg(7);
					state_nxt.ctrl_data_buffer.left <= state.ctrl_data_shift_reg(8);
					state_nxt.ctrl_data_buffer.down <= state.ctrl_data_shift_reg(9);
					state_nxt.ctrl_data_buffer.right <= state.ctrl_data_shift_reg(10);
					state_nxt.ctrl_data_buffer.up <= state.ctrl_data_shift_reg(11);
					state_nxt.ctrl_data_buffer.start <= state.ctrl_data_shift_reg(12);
					state_nxt.ctrl_data_buffer.r3 <= state.ctrl_data_shift_reg(13);
					state_nxt.ctrl_data_buffer.l3 <= state.ctrl_data_shift_reg(14);
					state_nxt.ctrl_data_buffer.sel <= state.ctrl_data_shift_reg(15);
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
				
				case to_integer(unsigned(state.byte_cnt)) is
					
					when 0 => state_nxt.cmd <= "00000001";
					when 1 => state_nxt.cmd <= "01000010";
					when 2 => state_nxt.cmd <= "01011010";
					when others => 

				end case;

				state_nxt.fsm_state <= CLK_LOW;

				ds_clk <= '1';
				ds_att <= '0';
				ds_cmd <= '1';

			when CLK_LOW =>

				if (to_integer(unsigned(state.clk_cnt)) = BIT_TIME / 2) then
					state_nxt.fsm_state <= CLK_HIGH;
					state_nxt.clk_cnt <= (others => '0');
				else
					state_nxt.clk_cnt <= std_logic_vector(unsigned(state.clk_cnt) + 1);
				end if;
				
				ds_clk <= '0';
				ds_att <= '0';
				ds_cmd <= state.cmd(to_integer(unsigned(state.bit_cnt)));

			when CLK_HIGH =>		

				if (to_integer(unsigned(state.clk_cnt)) = BIT_TIME / 2) then

					if (to_integer(unsigned(state.bit_cnt)) = 7) then
						state_nxt.fsm_state <= WAIT_ACK;
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

				if (to_integer(unsigned(state.byte_cnt)) >= 2) then
					state_nxt.ctrl_data_shift_reg <= state.ctrl_data_shift_reg(47 downto 0) & ds_data;
				elsif (to_integer(unsigned(state.byte_cnt)) = 1) then
					state_nxt.mode_and_bytes_shift_reg <= state.mode_and_bytes_shift_reg(6 downto 0) & ds_data;
				end if;

			when WAIT_ACK =>
					
				if (ds_ack = '1') then
					state_nxt.fsm_state <= WAIT_BEFORE_NEXT_BYTE;
				end if;

				if (to_integer(unsigned(state.byte_cnt)) = 2) then
					case state.mode_and_bytes_shift_reg(7 downto 4) is
						
						when "0100" => state_nxt.ctrl_mode <= DIGITAL;
						when "0111" => state_nxt.ctrl_mode <= ANALOG;
						when "1111" => state_nxt.ctrl_mode <= CONFIG;
						when others =>

					end case;

					case state.mode_and_bytes_shift_reg(3 downto 0) is
						
						when "0001" => state_nxt.bytes_total <= std_logic_vector(to_unsigned(2, 4));
						when "0011" => state_nxt.bytes_total <= std_logic_vector(to_unsigned(6, 4));
						when others =>

					end case;
				end if;

				ds_clk <= '1';
				ds_att <= '0';
				ds_cmd <= '1';

			when WAIT_BEFORE_NEXT_BYTE =>
				
				if (to_integer(unsigned(state.clk_cnt)) = BIT_TIME) then

					if (to_integer(unsigned(state.byte_cnt)) >= 2 and unsigned(state.byte_cnt) = unsigned(state.bytes_total) + 3) then
						state_nxt.byte_cnt <= (others => '0');
						state_nxt.fsm_state <= PACKET_TIMEOUT;
						state_nxt.bytes_total <= (others => '0');

						ds_att <= '1';
					else
						state_nxt.fsm_state <= CLK_LOW;
					end if;

					state_nxt.clk_cnt <= (others => '0');
				else
					state_nxt.clk_cnt <= std_logic_vector(unsigned(state.clk_cnt) + 1);
				end if;

				ds_clk <= '1';
				ds_cmd <= '1';
				if (state_nxt.fsm_state /= PACKET_TIMEOUT) then
					ds_att <= '0';
				end if;
				
		end case;
	end process;

end architecture;
