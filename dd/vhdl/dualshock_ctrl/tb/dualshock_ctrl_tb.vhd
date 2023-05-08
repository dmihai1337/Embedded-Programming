library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dualshock_pkg.all;

entity dualshock_ctrl_tb is
end entity;

architecture bench of dualshock_ctrl_tb is

	signal res_n : std_logic;
	signal clk : std_logic;
	
	signal ds_clk : std_logic;
	signal ds_cmd : std_logic;
	signal ds_data : std_logic; 		
	signal ds_att : std_logic;   		
	signal ds_ack : std_logic;   		

	signal ctrl_data : dualshock_t;
	signal big_motor : std_logic_vector(7 downto 0);
	signal small_motor : std_logic;

	constant CLK_PERIOD : time := 20 ns;
	signal stop_clock : boolean := false;
	
	signal N : integer := 0;

begin

	ctrl_interface : entity work.dualshock_ctrl(arch)
	generic map(
		CLK_FREQ => 50_000_000,
		DS_CLK_FREQ => 250_000,
		REFRESH_TIMEOUT => 500_000,
		BIT_TIME => 200
	)
	port map(
		clk   			=> clk,
		res_n 			=> res_n,
		ds_clk  		=> ds_clk,
		ds_cmd  		=> ds_cmd,
		ds_data 		=> ds_data,
		ds_att   		=> ds_att,
		ds_ack   		=> ds_ack,
		ctrl_data 		=> ctrl_data,
		big_motor       => big_motor,
		small_motor 	=> small_motor
	);
	-- add your testcode here
	stimulus : process
	begin	

		res_n <= '0';
		ds_data <= '0';
		ds_ack <= '0';

		big_motor <= (others => '0');
		small_motor <= '0';
		
		wait until rising_edge(clk);	
		wait until rising_edge(clk);

		res_n <= '1';

		wait until rising_edge(clk);	
		wait until rising_edge(clk);
		wait until rising_edge(clk);	
		wait until rising_edge(clk);
		

		wait for 20 ms;
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

