library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY arch is
	port(
		input: in std_logic_vector(7 downto 0);
		clock: in std_logic;
		led1, led2, led3, led4: out std_logic;
		seven1, seven2, seven3, seven4: out std_logic_vector(6 downto 0)
	);
end ENTITY;

architecture behv of arch is

component LEDcontrol is
	port(
		AQI: in std_logic_vector(15 downto 0);
		clock: in std_logic;
		led1, led2, led3, led4: out std_logic
	);
end component;

component reg is
	port(
		concentration: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(15 downto 0)
	);
end component;

component binaryToBCD is

	port( input: in std_logic_vector(15 downto 0);
			d1, d2, d3, d4: out std_logic_vector(3 downto 0)
	);
	
end component;

component bcdtoseven is
 
	port(
		input: in std_logic_vector(3 downto 0);
		output: out std_logic_vector(6 downto 0)
	);
 
end component;

signal AQI: std_logic_vector(15 downto 0);
signal d1, d2, d3, d4: std_logic_vector(3 downto 0);

begin

regressionUnit: reg port map(concentration => input, output => AQI);
ledController: LEDcontrol port map(AQI => AQI, clock => clock, led1 => led1, led2 => led2, led3 => led3, led4 => led4);

bintobcd: binaryToBCD port map(input => AQI, d1 => d1, d2 => d2, d3 => d3, d4 => d4);

bcdtosev1: bcdtoseven port map(input => d1, output => seven1);
bcdtosev2: bcdtoseven port map(input => d2, output => seven2);
bcdtosev3: bcdtoseven port map(input => d3, output => seven3);
bcdtosev4: bcdtoseven port map(input => d4, output => seven4);
end architecture;