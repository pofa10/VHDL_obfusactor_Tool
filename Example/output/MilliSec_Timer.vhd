library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;






entity milliSec_Timer is
	generic(
		IFRjwQFpuSctBPsDJVODQkzdqnIXIW : INTEGER := 100 
	);
	Port (
		bSPxAQBVeAcvvyoZCZmlYxPzwVTHDS        : in  STD_LOGIC;
		AhFpJhSxuRZxlhVTGeDFtUpcCqKYTi           : in  STD_LOGIC;
		IiJHIEIcwNmvPVhzTplrBQVMBIjEHa : out STD_LOGIC
	);
end milliSec_Timer;

architecture Behavioral of milliSec_Timer is

	CONSTANT uwkMPkcPFGUxuUnOkmTMFLIqsOgjMq   : INTEGER               := 1000 / IFRjwQFpuSctBPsDJVODQkzdqnIXIW; 
	CONSTANT uFtWADrnwpENoGGFAeQinNOgxLFtqV    : INTEGER               := 1e6;           
	SIGNAL SutvGFYyzxhQrJrqiOZNDSoJrZqadO      : INTEGER               := uFtWADrnwpENoGGFAeQinNOgxLFtqV/uwkMPkcPFGUxuUnOkmTMFLIqsOgjMq;
	SIGNAL WWsyBUGWNesFypzuVFhryFdJbKlEsz : UNSIGNED(31 downto 0) := (others => '0');
	SIGNAL leqsfBGvNYWMpjvnaEtxHSdZSMsLEp : STD_LOGIC             := '0';

begin

	process(AhFpJhSxuRZxlhVTGeDFtUpcCqKYTi)
	begin
		if (bSPxAQBVeAcvvyoZCZmlYxPzwVTHDS = '0') then
			leqsfBGvNYWMpjvnaEtxHSdZSMsLEp <= '0';
			WWsyBUGWNesFypzuVFhryFdJbKlEsz <= (others => '0');

		elsif rising_edge(AhFpJhSxuRZxlhVTGeDFtUpcCqKYTi) then

			WWsyBUGWNesFypzuVFhryFdJbKlEsz <= WWsyBUGWNesFypzuVFhryFdJbKlEsz + 1;
			leqsfBGvNYWMpjvnaEtxHSdZSMsLEp <= '0';
			if (WWsyBUGWNesFypzuVFhryFdJbKlEsz = SutvGFYyzxhQrJrqiOZNDSoJrZqadO - 1) then
				leqsfBGvNYWMpjvnaEtxHSdZSMsLEp <= '1';
				WWsyBUGWNesFypzuVFhryFdJbKlEsz <= (others => '0');
			end if;

		end if;
	end process;

	IiJHIEIcwNmvPVhzTplrBQVMBIjEHa <= leqsfBGvNYWMpjvnaEtxHSdZSMsLEp;

end Behavioral;
