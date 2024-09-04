library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity milliSec_Timer is
	generic(
		g_Freq : INTEGER := 100 -- in MHz
	);
	Port (
		i_Enable        : in  STD_LOGIC;
		i_CLK           : in  STD_LOGIC;
		o_MilliSec_Tick : out STD_LOGIC
	);
end milliSec_Timer;

architecture Behavioral of milliSec_Timer is

	CONSTANT c_CLKPeriod   : INTEGER               := 1000 / g_Freq; -- in ns
	CONSTANT c_1ms_Time    : INTEGER               := 1e6;           -- in ns
	SIGNAL c_1ms_Step      : INTEGER               := c_1ms_Time/c_CLKPeriod;
	SIGNAL s_milliSen_Cntr : UNSIGNED(31 downto 0) := (others => '0');
	SIGNAL s_MilliSec_Tick : STD_LOGIC             := '0';

begin

	process(i_CLK)
	begin
		if (i_Enable = '0') then
			s_MilliSec_Tick <= '0';
			s_milliSen_Cntr <= (others => '0');

		elsif rising_edge(i_CLK) then

			s_milliSen_Cntr <= s_milliSen_Cntr + 1;
			s_MilliSec_Tick <= '0';
			if (s_milliSen_Cntr = c_1ms_Step - 1) then
				s_MilliSec_Tick <= '1';
				s_milliSen_Cntr <= (others => '0');
			end if;

		end if;
	end process;

	o_MilliSec_Tick <= s_MilliSec_Tick;

end Behavioral;
