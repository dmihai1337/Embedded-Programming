library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dualshock_pkg.all;

entity ssd_ctrl_tb is
end entity;

architecture bench of ssd_ctrl_tb is

	signal clk : std_logic;
	signal res_n : std_logic;
	signal sw_enable : std_logic;
	signal sw_stick_selector : std_logic;
	signal sw_axis_selector : std_logic;
	signal btn_change_sign_mode_n : std_logic;
	signal ctrl_data : dualshock_t;
	
	signal hex0 : std_logic_vector(6 downto 0);
	signal hex1 : std_logic_vector(6 downto 0);
	signal hex2 : std_logic_vector(6 downto 0);
	signal hex3 : std_logic_vector(6 downto 0);
	signal hex4 : std_logic_vector(6 downto 0);
	signal hex5 : std_logic_vector(6 downto 0);
	signal hex6 : std_logic_vector(6 downto 0);
	signal hex7 : std_logic_vector(6 downto 0);

	constant CLK_PERIOD : time := 10 ns;
	signal stop_clock : boolean := false;
begin

	uut : entity work.ssd_ctrl
		port map (
			clk         			=> clk,
			res_n       			=> res_n,
			hex0        			=> hex0,
			hex1        			=> hex1,
			hex2        			=> hex2,
			hex3        			=> hex3,
			hex4        			=> hex4,
			hex5        			=> hex5,
			hex6        			=> hex6,
			hex7        			=> hex7,
			ctrl_data   			=> ctrl_data,
			sw_enable   	  		=> sw_enable,
			sw_stick_selector 		=> sw_stick_selector,
			sw_axis_selector  		=> sw_axis_selector,
			btn_change_sign_mode_n	=> btn_change_sign_mode_n
		);

	stimulus : process
	begin
		ctrl_data.ls_x <= x"dd";
		ctrl_data.ls_y <= x"ca";
		ctrl_data.rs_x <= x"20";
		ctrl_data.rs_y <= x"23";
		res_n <= '0';
		sw_enable <= '0';
		sw_stick_selector <= '0';
		sw_axis_selector <= '0';
		btn_change_sign_mode_n <= '1';
		
		
		-- TEST CASE 1 - EXPECTED OUTPUT ON SSD: dd CA 2023 --

		wait until rising_edge(clk);
		wait until rising_edge(clk);
		res_n <= '1';
		
		for k in 0 to 15 loop
			wait until rising_edge(clk);
		end loop;
		
		assert hex0 = "0110000" report "error on test case 1" severity error;
		assert hex1 = "0100100" report "error on test case 1" severity error;
		assert hex2 = "1000000" report "error on test case 1" severity error;
		assert hex3 = "0100100" report "error on test case 1" severity error;
		assert hex4 = "0001000" report "error on test case 1" severity error;
		assert hex5 = "1000110" report "error on test case 1" severity error;
		assert hex6 = "0100001" report "error on test case 1" severity error;
		assert hex7 = "0100001" report "error on test case 1" severity error;

		
		-- TEST CASE 2 - EXPECTED OUTPUT ON SSD: 20 23  35 --
		
		sw_enable <= '1';
		
		for k in 0 to 15 loop
			wait until rising_edge(clk);
		end loop;
		
		assert hex0 = "0010010" report "error on test case 2" severity error;
		assert hex1 = "0110000" report "error on test case 2" severity error;
		assert hex2 = "1000000" report "error on test case 2" severity error;
		assert hex3 = "1111111" report "error on test case 2" severity error;
		assert hex4 = "0110000" report "error on test case 2" severity error;
		assert hex5 = "0100100" report "error on test case 2" severity error;
		assert hex6 = "1000000" report "error on test case 2" severity error;
		assert hex7 = "0100100" report "error on test case 2" severity error;
		
		-- TEST CASE 3 - EXPECTED OUTPUT ON SSD: dd CA  221 --
		
		sw_stick_selector <= '1';
		sw_axis_selector <= '1';
			
		for k in 0 to 15 loop
			wait until rising_edge(clk);
		end loop;

		assert hex0 = "1111001" report "error on test case 3" severity error;
		assert hex1 = "0100100" report "error on test case 3" severity error;
		assert hex2 = "0100100" report "error on test case 3" severity error;
		assert hex3 = "1111111" report "error on test case 3" severity error;
		assert hex4 = "0001000" report "error on test case 3" severity error;
		assert hex5 = "1000110" report "error on test case 3" severity error;
		assert hex6 = "0100001" report "error on test case 3" severity error;
		assert hex7 = "0100001" report "error on test case 3" severity error;

		-- TEST CASE 4 - EXPECTED OUTPUT ON SSD: dd CA -035 --
		
		btn_change_sign_mode_n <= '0';
		wait until rising_edge(clk);
		btn_change_sign_mode_n <= '1';

		for k in 0 to 15 loop
			wait until rising_edge(clk);
		end loop;

		
		assert hex0 = "0010010" report "error on test case 4" severity error;
		assert hex1 = "0110000" report "error on test case 4" severity error;
		assert hex2 = "1000000" report "error on test case 4" severity error;
		assert hex3 = "0111111" report "error on test case 4" severity error;
		assert hex4 = "0001000" report "error on test case 4" severity error;
		assert hex5 = "1000110" report "error on test case 4" severity error;
		assert hex6 = "0100001" report "error on test case 4" severity error;
		assert hex7 = "0100001" report "error on test case 4" severity error;

		wait for 1 us;
		stop_clock <= true;
		report "simulation done";
		wait;
	end process;

	generate_clk : process
	begin
		while not stop_clock loop
			clk <= '0', '1' after CLK_PERIOD / 2;
			wait for CLK_PERIOD;
		end loop;
		wait;
	end process;

end architecture;

