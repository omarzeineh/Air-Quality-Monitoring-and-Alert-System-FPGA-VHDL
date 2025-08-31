library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
ENTITY blinker is

	port(
			clock: in std_logic;
			output: out std_logic
	);
end ENTITY;


architecture behv of blinker is

	Component comparator is 
	
		generic (
			n: integer
		);
		port(
			c1, c2: in std_logic_vector(n-1 downto 0);
			output: out std_logic
		);
		
	end component;
 
	Component accu is
	
		generic (
			n: integer
		);
		port(
			reset, clk: in std_logic;
			output: buffer std_logic_vector(n-1 downto 0)
		);
	end component;
	
	signal f1: std_logic_vector(25 downto 0);
	signal f2: std_logic_vector(1 downto 0);
	
	signal o1, o2: std_logic;

	begin

		comp1: comparator generic map (n => 26) port map (c1 => f1, c2 => "01011111010111100001000000", output => o1);
		comp2: comparator generic map (n => 2) port map (c1 => f2, c2 => "10", output => o2);
 
		acc1: accu generic map (n => 26) port map (reset => o1, clk => clock, output => f1);
		acc2: accu generic map (n => 2) port map (reset => o2, clk => o1, output => f2);
		
		output <= f2(0);
	
end architecture;