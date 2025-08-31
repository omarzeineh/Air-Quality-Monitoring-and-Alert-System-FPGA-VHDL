library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY LEDcontrol is
	port(
		AQI: in std_logic_vector(15 downto 0);
		clock: in std_logic;
		led1, led2, led3, led4: out std_logic
	);
end ENTITY;

architecture behv of LEDcontrol is

component stateDecider is
	port(
		AQI: in std_logic_vector(15 downto 0);
		D: out std_logic_vector(2 downto 0)
	);
end component;

component blinker is

	port(
			clock: in std_logic;
			output: out std_logic
	);
end component;

component mux8x1 is
	port(
		in0, in1, in2, in3, in4, in5, in6, in7: in std_logic;
		D: in std_logic_vector(2 downto 0);
		output: out std_logic
	);
end component;

signal d: std_logic_vector(2 downto 0);
signal b: std_logic;

begin

statedec: stateDecider port map(AQI => AQI, D => d);

blink: blinker port map(clock => clock, output => b);

mux1: mux8x1 port map(in0 => '1', in1 => '1', in2 => '1',in3 => '1', in4 => b, in5 => '0', in6 => '0', in7 => '0', D => d, output => led1);
mux2: mux8x1 port map(in0 => '1', in1 => '1', in2 => '1',in3 => b, in4 => b, in5 => '0', in6 => '0', in7 => '0', D => d, output => led2);
mux3: mux8x1 port map(in0 => '1', in1 => '1', in2 => b,in3 => b, in4 => b, in5 => '0', in6 => '0', in7 => '0', D => d, output => led3);
mux4: mux8x1 port map(in0 => '1', in1 => '0', in2 => '0',in3 => '0', in4 => b, in5 => '0', in6 => '0', in7 => '0', D => d, output => led4);


end architecture;