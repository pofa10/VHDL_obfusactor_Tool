library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;






entity milliSec_Timer is
	generic(
		QRYwJhgcjocjhmlsVQFBDUYOgKlAJd : INTEGER := 100 
	);
	Port (
		cSrNJqgEuoWvjlecoaCjtEkbfdggtL        : in  STD_LOGIC;
		npuuXXSUQcmoLTQRyWGbwKWdGDhcuR           : in  STD_LOGIC;
		pqnCozObfzpmbsPybhnHDkqjbOHuWx : out STD_LOGIC
	);
end milliSec_Timer;

architecture Behavioral of milliSec_Timer is

	CONSTANT dmIEscdBIcEbIigxYveYNUvHJCyQLu   : INTEGER               := 1000 / QRYwJhgcjocjhmlsVQFBDUYOgKlAJd; 
	CONSTANT CbAAokzJsHggOLjNukggFxYzOFSnhX    : INTEGER               := 1e6;           
	SIGNAL iOcVWnjJjyyLkaIqRoyBrOcztatImj      : INTEGER               := CbAAokzJsHggOLjNukggFxYzOFSnhX/dmIEscdBIcEbIigxYveYNUvHJCyQLu;
	SIGNAL JATyTvwnfurkarMuAPVitdiDzsNdbZ : UNSIGNED(31 downto 0) := (others => '0');
	SIGNAL jelHSHmSEWtwMxmUWyJVWrXgSihMZX : STD_LOGIC             := '0';

begin

	process(npuuXXSUQcmoLTQRyWGbwKWdGDhcuR)
	begin
		if (cSrNJqgEuoWvjlecoaCjtEkbfdggtL = '0') then
			jelHSHmSEWtwMxmUWyJVWrXgSihMZX <= '0';
			JATyTvwnfurkarMuAPVitdiDzsNdbZ <= (others => '0');

		elsif rising_edge(npuuXXSUQcmoLTQRyWGbwKWdGDhcuR) then

			JATyTvwnfurkarMuAPVitdiDzsNdbZ <= JATyTvwnfurkarMuAPVitdiDzsNdbZ + 1;
			jelHSHmSEWtwMxmUWyJVWrXgSihMZX <= '0';
			if (JATyTvwnfurkarMuAPVitdiDzsNdbZ = iOcVWnjJjyyLkaIqRoyBrOcztatImj - 1) then
				jelHSHmSEWtwMxmUWyJVWrXgSihMZX <= '1';
				JATyTvwnfurkarMuAPVitdiDzsNdbZ <= (others => '0');
			end if;

		end if;
	end process;

	pqnCozObfzpmbsPybhnHDkqjbOHuWx <= jelHSHmSEWtwMxmUWyJVWrXgSihMZX;

end Behavioral;
