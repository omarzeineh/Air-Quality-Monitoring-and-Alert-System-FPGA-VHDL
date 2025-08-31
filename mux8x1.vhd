library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY mux8x1 is
	port(
		in0, in1, in2, in3, in4, in5, in6, in7: in std_logic;
		D: in std_logic_vector(2 downto 0);
		output: out std_logic
	);
end ENTITY;

architecture behv of mux8x1 is
begin
process(in0, in1, in2, in3, in4, in5, in6, in7, D)
begin
	case D is
		When "000" => output <= in0;
		When "001" => output <= in1;
		When "010" => output <= in2;
		When "011" => output <= in3;
		When "100" => output <= in4;
		When "101" => output <= in5;
		When "110" => output <= in6;
		When "111" => output <= in7;
	end case;
end process;
end architecture;