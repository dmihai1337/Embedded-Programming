library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
<<<<<<< HEAD
use ieee.std_logic_unsigned.all;
=======
>>>>>>> 6165a0b0644cb146ab1d4d2568a71b21bf33eb2e
use work.dualshock_pkg.all;

entity ssd_ctrl is
	port (
		clk : in std_logic;
		res_n : in std_logic;

		-- controller input
		ctrl_data : in dualshock_t;

		-- button/switch inputs
		sw_enable : in std_logic;
		sw_stick_selector : in std_logic;
		sw_axis_selector : in std_logic;
		btn_change_sign_mode_n : in std_logic;

		-- seven-segment display outputs
		hex0 : out std_logic_vector(6 downto 0);
		hex1 : out std_logic_vector(6 downto 0);
		hex2 : out std_logic_vector(6 downto 0);
		hex3 : out std_logic_vector(6 downto 0);
		hex4 : out std_logic_vector(6 downto 0);
		hex5 : out std_logic_vector(6 downto 0);
		hex6 : out std_logic_vector(6 downto 0);
		hex7 : out std_logic_vector(6 downto 0)
	);
end entity;


architecture arch of ssd_ctrl is
<<<<<<< HEAD
	
	function to_segs_hex(value : in std_logic_vector(3 downto 0)) return std_logic_vector is
	begin
		case value is
			when x"0" => return "1000000";
			when x"1" => return "1111001";
			when x"2" => return "0100100";
			when x"3" => return "0110000";
			when x"4" => return "0011001";
			when x"5" => return "0010010";
			when x"6" => return "0000010";
			when x"7" => return "1111000";
			when x"8" => return "0000000";
			when x"9" => return "0010000";
			when x"A" => return "0001000";
			when x"B" => return "0000011";
			when x"C" => return "1000110";
			when x"D" => return "0100001";
			when x"E" => return "0000110";
			when x"F" => return "0001110";
			when others => return "1111111";
		end case;
	end function;

	function to_segs_dec(value : integer) return std_logic_vector is
	begin
		case value is
			when 0 => return "1000000";
			when 1 => return "1111001";
			when 2 => return "0100100";
			when 3 => return "0110000";
			when 4 => return "0011001";
			when 5 => return "0010010";
			when 6 => return "0000010";
			when 7 => return "1111000";
			when 8 => return "0000000";
			when 9 => return "0010000";
			when others => return "1111111";
		end case;
	end function;

	type fsm_state_t is (IDLE, CONVERT, DISPLAY);

	signal fsm_state, fsm_state_next : fsm_state_t;

	-- INPUT SIGNALS --

	type input_t is record
		ctrl_data : dualshock_t;
		sw_enable : std_logic;
		sw_stick_selector : std_logic;
		sw_axis_selector : std_logic;
		btn_change_sign_mode_n : std_logic;
	end record;

	signal input, input_next : input_t;
	
	-- AUXILIARY SIGNALS USED TO BUILD NEEDED FUNCTIONALITY

	signal last_sign_enable, last_sign_enable_next : std_logic;
	signal hundreds_d, hundreds_d_next, tenths_d, tenths_d_next, units_d, units_d_next: integer := 0;
	signal sign, sign_next : boolean; 
	signal hundreds_ready, hundreds_ready_next, tenths_ready, tenths_ready_next, 
	units_ready, units_ready_next : boolean;
	shared variable value, value_next : std_logic_vector(7 downto 0);
	signal aux_count, aux_count_next : integer := 0; signal first_entry, first_entry_next : boolean := true;
	constant ctrl_res_val : std_logic_vector(47 downto 0) := (others => '0');
	
begin

	state_register : process(clk, res_n)
	begin
		if (res_n = '0') then 
			fsm_state <= IDLE;
			input <= (
				ctrl_data => to_dualshock_t(ctrl_res_val),
				sw_enable => '0',
				sw_stick_selector => '0',
				sw_axis_selector => '0',
				btn_change_sign_mode_n => '1'
			);
			last_sign_enable <= '0';
			aux_count <= 0;
			first_entry <= true;
			value := "00000000";
			sign <= false;
			hundreds_d <= 0;
			tenths_d <= 0;
			units_d <= 0;
			hundreds_ready <= false;
			tenths_ready <= false;
			units_ready <= false;

		elsif (rising_edge(clk)) then
			fsm_state <= fsm_state_next;
			input <= input_next;
			last_sign_enable <= last_sign_enable_next;
			aux_count <= aux_count_next;
			first_entry <= first_entry_next;
			value := value_next;
			sign <= sign_next;
			hundreds_d <= hundreds_d_next;
			tenths_d <= tenths_d_next;
			units_d <= units_d_next;
			hundreds_ready <= hundreds_ready_next;
			tenths_ready <= tenths_ready_next;
			units_ready <= units_ready_next;
		end if;
	end process;

	next_state_logic : process(	ctrl_data,sw_enable,sw_stick_selector,sw_axis_selector,
					btn_change_sign_mode_n, fsm_state, aux_count, first_entry,
					hundreds_ready, tenths_ready, units_ready, sign,
				   	last_sign_enable, hundreds_d, tenths_d, units_d, input)
	begin
		fsm_state_next <= fsm_state;
		aux_count_next <= aux_count;
		first_entry_next <= first_entry;
		value_next := value;
		sign_next <= sign;
		hundreds_ready_next <= hundreds_ready;
		tenths_ready_next <= tenths_ready;	
		units_ready_next <= units_ready;
		hundreds_d_next <= hundreds_d;
		tenths_d_next <= tenths_d;
		units_d_next <= units_d;
		
		if (fsm_state /= CONVERT) then
			input_next.ctrl_data <= ctrl_data;
			input_next.sw_enable <= sw_enable;
			input_next.sw_stick_selector <= sw_stick_selector;
			input_next.sw_axis_selector <= sw_axis_selector;
			input_next.btn_change_sign_mode_n <= btn_change_sign_mode_n;
			if (input.btn_change_sign_mode_n and (not btn_change_sign_mode_n)) then
				last_sign_enable_next <= not last_sign_enable;
			else 
				last_sign_enable_next <= last_sign_enable;
			end if;
		else
			input_next.ctrl_data <= input.ctrl_data;
			input_next.sw_enable <= input.sw_enable;
			input_next.sw_stick_selector <= input.sw_stick_selector;
			input_next.sw_axis_selector <= input.sw_axis_selector;
			input_next.btn_change_sign_mode_n <= input.btn_change_sign_mode_n;
			last_sign_enable_next <= last_sign_enable;
		end if;

		case fsm_state is
			when IDLE => 
				if ((input.sw_enable = '0' and sw_enable = '1')) then
					fsm_state_next <= CONVERT;
					first_entry_next <= true;
					aux_count_next <= 0;
				end if;
			when DISPLAY =>
				if ( (input.ctrl_data /= ctrl_data)
					or (input.sw_axis_selector /= sw_axis_selector) 
					or (input.sw_stick_selector /= sw_stick_selector)
					or (input.btn_change_sign_mode_n = '1' and btn_change_sign_mode_n = '0')) then
						fsm_state_next <= CONVERT;
						first_entry_next <= true;
						aux_count_next <= 0;
				elsif (input.sw_enable = '1' and sw_enable = '0') then
					fsm_state_next <= IDLE;
				end if;
			when CONVERT =>

				-- IF IT'S THE FIRST TIME ENTERING CONVERT MODE, SET UP NEEDED PARAMETERS --

				if (first_entry = true) then
					hundreds_ready_next <= false;
					tenths_ready_next <= false;
					units_ready_next <= false;

					if (input.sw_axis_selector = '0') then
						if (input.sw_stick_selector = '0') then
							value_next := input.ctrl_data.rs_y(7 downto 0);
						else
							value_next := input.ctrl_data.rs_x(7 downto 0);
						end if;
					else
						if (input.sw_stick_selector = '0') then
							value_next := input.ctrl_data.ls_y(7 downto 0);
						else
							value_next := input.ctrl_data.ls_x(7 downto 0);
						end if;
					end if;
					
					if (last_sign_enable = '1') then
						if (value_next(7) = '1') then
							sign_next <= true;
							value_next := not (value_next - 1);
						else
							sign_next <= false;
						end if;
					else
						sign_next <= false;
					end if;
					
					first_entry_next <= false;

				-- OTHERWISE COMPUTE THE OUTPUT NUMBER AND SAVE IT --

				elsif (hundreds_ready = false) then
					if (value > "01100011") then
						value_next := value - "01100100";
						aux_count_next <= aux_count + 1;
					elsif (value <= "01100011") then
						if (aux_count > 0) then
							hundreds_d_next <= aux_count;
						else
							hundreds_d_next <= 0;
						end if;
						hundreds_ready_next <= true;
					end if;
				elsif (tenths_ready = false) then
					if (value > "00001001") then
						value_next := value - "00001010";
						aux_count_next <= aux_count + 1;
					elsif (value <= "00001001") then
						if (aux_count > 0) then
							tenths_d_next <= aux_count - hundreds_d;
						else
							tenths_d_next <= 0;
						end if;
						tenths_ready_next <= true;
					end if;
				elsif (units_ready = false) then
					if (value > "00000000") then
						value_next := value - "00000001";
						aux_count_next <= aux_count + 1;
					elsif (value = "00000000") then
						if (aux_count > 0) then
							units_d_next <= aux_count - tenths_d - hundreds_d;
						else
							units_d_next <= 0;
						end if;
						units_ready_next <= true;
					end if;
				else	
					if (input.sw_enable = '0') then
						fsm_state_next <= IDLE;
					else
						fsm_state_next <= DISPLAY;
					end if;
				end if;
		end case;
	end process;

	output_logic : process(fsm_state, input, sign, hundreds_d, tenths_d, units_d)
	begin
		case fsm_state is
			when IDLE =>
				hex0 <= to_segs_hex(input.ctrl_data.rs_y(3 downto 0));
				hex1 <= to_segs_hex(input.ctrl_data.rs_y(7 downto 4));
				hex2 <= to_segs_hex(input.ctrl_data.rs_x(3 downto 0));
				hex3 <= to_segs_hex(input.ctrl_data.rs_x(7 downto 4));
				hex4 <= to_segs_hex(input.ctrl_data.ls_y(3 downto 0));
				hex5 <= to_segs_hex(input.ctrl_data.ls_y(7 downto 4));
				hex6 <= to_segs_hex(input.ctrl_data.ls_x(3 downto 0));
				hex7 <= to_segs_hex(input.ctrl_data.ls_x(7 downto 4));
			when DISPLAY => 
				if (input.sw_stick_selector = '0') then
					hex4 <= to_segs_hex(input.ctrl_data.rs_y(3 downto 0));
					hex5 <= to_segs_hex(input.ctrl_data.rs_y(7 downto 4));
					hex6 <= to_segs_hex(input.ctrl_data.rs_x(3 downto 0));
					hex7 <= to_segs_hex(input.ctrl_data.rs_x(7 downto 4));
				else 
					hex4 <= to_segs_hex(input.ctrl_data.ls_y(3 downto 0));
					hex5 <= to_segs_hex(input.ctrl_data.ls_y(7 downto 4));
					hex6 <= to_segs_hex(input.ctrl_data.ls_x(3 downto 0));
					hex7 <= to_segs_hex(input.ctrl_data.ls_x(7 downto 4));
				end if;
				
				if (sign = false) then
					hex3 <= "1111111";
				else
					hex3 <= "0111111";
				end if;
				
				hex2 <= to_segs_dec(hundreds_d);
				hex1 <= to_segs_dec(tenths_d);
				hex0 <= to_segs_dec(units_d);
			when CONVERT =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				hex4 <= "1111111";
				hex5 <= "1111111";
				hex6 <= "1111111";
				hex7 <= "1111111";
		end case;
	end process;

=======
begin
>>>>>>> 6165a0b0644cb146ab1d4d2568a71b21bf33eb2e
end architecture;
