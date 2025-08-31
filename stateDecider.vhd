library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY stateDecider is
	port(
		AQI: in std_logic_vector(15 downto 0);
		D: out std_logic_vector(2 downto 0)
	);
end ENTITY;

architecture behv of stateDecider is
begin
process(AQI)
begin
	if (AQI <= "0000000000110010") then
		D <= "000";
	elsif (AQI >= "0000000000110011" and AQI <= "0000000001100100") then
		D <= "001";
	elsif (AQI >= "0000000001100101" and AQI <= "0000000010010110") then
		D <= "010";
	elsif (AQI >= "0000000010010111" and AQI <= "0000000011001000") then
		D <= "011";
	elsif (AQI >= "0000000011001000") then
		D <= "100";
	else
		D <= "111";
	end if;
end process;
end architecture;
