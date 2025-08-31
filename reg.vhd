library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY reg is
	port(
		concentration: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(15 downto 0)
	);
end ENTITY;
architecture behv of reg is

signal x, xs1, xs5, xs8, x2, x2s5, x2s9: std_logic_vector(24 downto 0);
signal s1, s2, s3, s4, s5, s6, s7, s8: std_logic_vector(24 downto 0);

	begin
		process(concentration)
			begin
				x <= "00000000" & concentration(7 downto 0) & "000000000";
				x2 <= concentration * concentration & "000000000";
				xs1 <= '0' & x(24 downto 1);
				xs5 <= "0000" & xs1(24 downto 4);
				xs8 <= "000" & xs5(24 downto 3);
				x2s5 <= "00000" & x2(24 downto 5);
				x2s9 <= "0000" & x2s5(24 downto 4);
            s1 <= x2s5 + x2s9;
            s2 <= s1 + x2s9;
            s3 <= s2 + x2s9;
            s4 <= xs1+ xs5;
            s5 <= s4+ xs5;
            s6 <= s5+ xs5;
            s7 <= s6+ xs8;
            s8 <= s7 + s3;
				output <= s8(24 downto 9) + s8(8);
		end process;

end architecture;