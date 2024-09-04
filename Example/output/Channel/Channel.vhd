



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;








entity Channel is
    generic (
        kkWulaqfbnuOGNHBndhnzIVIzkFpQJ : INTEGER := 1; 
        BFaKyByLJgFwLaDfPfjUqzHFBVHvmk   : INTEGER := 4 
    );
    Port (
        npuuXXSUQcmoLTQRyWGbwKWdGDhcuR          : in  STD_LOGIC;
        OIhOePZwcoYoueNikxKcPMrRMIvjwq    : in  STD_LOGIC;
        JmCOdyyntMvARPlZKwBYONaltBEXtJ  : in  STD_LOGIC;
        AuiLhQcfOHJPtQdeUfszqyHhhtjAZQ : out STD_LOGIC
    );
end Channel;


architecture Behavioral of Channel is

    
    CONSTANT dmIEscdBIcEbIigxYveYNUvHJCyQLu    : INTEGER := 10;
    CONSTANT yPqlUILAmaZkROjLBfMfhLahlEFelk  : INTEGER := (kkWulaqfbnuOGNHBndhnzIVIzkFpQJ * 1_000_000 / dmIEscdBIcEbIigxYveYNUvHJCyQLu);
    CONSTANT ssoMmMPderLvHKyOxQDcobYxIugCkL : INTEGER := (2**BFaKyByLJgFwLaDfPfjUqzHFBVHvmk);
    
    SIGNAL MMipPVXvoiDrxJbkzLlhADGomAEcVS      : STD_LOGIC := '0';
    SIGNAL MXTIwBWPdpnActpGaJwdMqeZwvjATa  : STD_LOGIC := '0';
    SIGNAL JpFGVKwZhTWgZThOYWgzOIUWoycoqj : STD_LOGIC := '0';


    SIGNAL rODUbaValjKlEUzaIWmXCkORUQRSSq : UNSIGNED (7 downto 0)  := (others => '0');
    SIGNAL bULREFVOVslJjTSkSIPGJApHTJnbrU  : UNSIGNED (31 downto 0) := (others => '0');

    
    SIGNAL cGcDdQARpOVgTMKEReVDgggtqrSSoN : UNSIGNED (7 downto 0)  := (others => '0');
    SIGNAL frmcWAzwlqjINPhevLQVMiToBYHGiU  : UNSIGNED (31 downto 0) := (others => '0');

    SIGNAL WGuQRREPvZfFnvhwNfqKXGaxXnWMDD        : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL lkWJBHMJAWqvbqjJwVvNOtqlahDPnh    : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL RAdkUHgdmqYQNXbIDKTvjHHvFLFOVN    : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL ODtaUxltvKpEsGwfechljZLfNRzbyJ     : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL tUqNcyoUwfoldIbgaDlTJKUtfpBgTj : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL VBoWsjpcYNAXkJzkifotjugesniJKp        : UNSIGNED (1 downto 0)  := (others => '0');

    
    SIGNAL pnlhmgECzBWbwQvvWUBNEEYwBoxUpS  : STD_LOGIC := '0';
    SIGNAL OUlfbMvvajWfjUgBrnkteyqCVqrApp : STD_LOGIC := '0';
    SIGNAL LYzXknQxdbjkpTnWbZoMUbZzvIUiAh    : STD_LOGIC := '0';

    
    
    type NaHRdiqjXAkHRFKnJTvvNLnnCqBHCb is (init_st,Comparison_st);
    SIGNAL stJKKHMwnnuDbvJePCqglgUfBokPsn : NaHRdiqjXAkHRFKnJTvvNLnnCqBHCb := init_st;


begin

    PulseCntr_proc0 : process(npuuXXSUQcmoLTQRyWGbwKWdGDhcuR)
    begin

        if (OIhOePZwcoYoueNikxKcPMrRMIvjwq = '1') then
            rODUbaValjKlEUzaIWmXCkORUQRSSq     <= (others => '0');
            RAdkUHgdmqYQNXbIDKTvjHHvFLFOVN <= (others => '0');
            WGuQRREPvZfFnvhwNfqKXGaxXnWMDD     <= (others => '0');
            stJKKHMwnnuDbvJePCqglgUfBokPsn           <= init_st;


        elsif rising_edge(npuuXXSUQcmoLTQRyWGbwKWdGDhcuR) then

            
            MXTIwBWPdpnActpGaJwdMqeZwvjATa <= MMipPVXvoiDrxJbkzLlhADGomAEcVS;

            
            bULREFVOVslJjTSkSIPGJApHTJnbrU <= bULREFVOVslJjTSkSIPGJApHTJnbrU + 1;

            
            pnlhmgECzBWbwQvvWUBNEEYwBoxUpS  <= '0';
            OUlfbMvvajWfjUgBrnkteyqCVqrApp <= '0';

            if (JpFGVKwZhTWgZThOYWgzOIUWoycoqj = '1') then
                WGuQRREPvZfFnvhwNfqKXGaxXnWMDD <= WGuQRREPvZfFnvhwNfqKXGaxXnWMDD + 1;
            end if;

            if (rODUbaValjKlEUzaIWmXCkORUQRSSq = cGcDdQARpOVgTMKEReVDgggtqrSSoN) then

                OUlfbMvvajWfjUgBrnkteyqCVqrApp <= '1';
                case BFaKyByLJgFwLaDfPfjUqzHFBVHvmk is
                    when 4 =>
                        RAdkUHgdmqYQNXbIDKTvjHHvFLFOVN <= x"0" & lkWJBHMJAWqvbqjJwVvNOtqlahDPnh(15 downto BFaKyByLJgFwLaDfPfjUqzHFBVHvmk);

                    when 5 =>
                        RAdkUHgdmqYQNXbIDKTvjHHvFLFOVN <= "00000" & lkWJBHMJAWqvbqjJwVvNOtqlahDPnh(15 downto BFaKyByLJgFwLaDfPfjUqzHFBVHvmk);

                    when 6 =>
                        RAdkUHgdmqYQNXbIDKTvjHHvFLFOVN <= "000000" & lkWJBHMJAWqvbqjJwVvNOtqlahDPnh(15 downto BFaKyByLJgFwLaDfPfjUqzHFBVHvmk);

                    when others =>
                        Null;

                end case;

                lkWJBHMJAWqvbqjJwVvNOtqlahDPnh <= (others => '0');
                rODUbaValjKlEUzaIWmXCkORUQRSSq     <= (others => '0');

            elsif (bULREFVOVslJjTSkSIPGJApHTJnbrU = frmcWAzwlqjINPhevLQVMiToBYHGiU) then

                pnlhmgECzBWbwQvvWUBNEEYwBoxUpS     <= '1';
                ODtaUxltvKpEsGwfechljZLfNRzbyJ <= WGuQRREPvZfFnvhwNfqKXGaxXnWMDD;
                
                rODUbaValjKlEUzaIWmXCkORUQRSSq     <= rODUbaValjKlEUzaIWmXCkORUQRSSq + 1;
                lkWJBHMJAWqvbqjJwVvNOtqlahDPnh <= lkWJBHMJAWqvbqjJwVvNOtqlahDPnh + ODtaUxltvKpEsGwfechljZLfNRzbyJ;
                
                bULREFVOVslJjTSkSIPGJApHTJnbrU  <= (others => '0');
                WGuQRREPvZfFnvhwNfqKXGaxXnWMDD <= (others => '0');

            end if;

            case stJKKHMwnnuDbvJePCqglgUfBokPsn is
                when init_st =>
                    if (VBoWsjpcYNAXkJzkifotjugesniJKp = "10") then
                        stJKKHMwnnuDbvJePCqglgUfBokPsn <= Comparison_st;
                    elsif (OUlfbMvvajWfjUgBrnkteyqCVqrApp = '1') then
                        VBoWsjpcYNAXkJzkifotjugesniJKp <= VBoWsjpcYNAXkJzkifotjugesniJKp + 1;
                        stJKKHMwnnuDbvJePCqglgUfBokPsn       <= init_st;
                    else
                        stJKKHMwnnuDbvJePCqglgUfBokPsn <= init_st;
                    end if;

                when Comparison_st =>
                    
                    if (pnlhmgECzBWbwQvvWUBNEEYwBoxUpS = '1') AND (ODtaUxltvKpEsGwfechljZLfNRzbyJ > tUqNcyoUwfoldIbgaDlTJKUtfpBgTj) then
                        LYzXknQxdbjkpTnWbZoMUbZzvIUiAh <= '1';
                    else
                        LYzXknQxdbjkpTnWbZoMUbZzvIUiAh <= '0';
                    end if;
            end case;


        end if;
    end process;

    
    
    tUqNcyoUwfoldIbgaDlTJKUtfpBgTj <= RAdkUHgdmqYQNXbIDKTvjHHvFLFOVN + ("000" & RAdkUHgdmqYQNXbIDKTvjHHvFLFOVN(15 downto 3));

    
    JpFGVKwZhTWgZThOYWgzOIUWoycoqj <= NOT(MXTIwBWPdpnActpGaJwdMqeZwvjATa) AND MMipPVXvoiDrxJbkzLlhADGomAEcVS;

    
    cGcDdQARpOVgTMKEReVDgggtqrSSoN <= to_unsigned(ssoMmMPderLvHKyOxQDcobYxIugCkL,cGcDdQARpOVgTMKEReVDgggtqrSSoN'length);
    frmcWAzwlqjINPhevLQVMiToBYHGiU  <= to_unsigned(yPqlUILAmaZkROjLBfMfhLahlEFelk,frmcWAzwlqjINPhevLQVMiToBYHGiU'length);

    
    MMipPVXvoiDrxJbkzLlhADGomAEcVS  <= JmCOdyyntMvARPlZKwBYONaltBEXtJ;
    AuiLhQcfOHJPtQdeUfszqyHhhtjAZQ <= LYzXknQxdbjkpTnWbZoMUbZzvIUiAh;

end Behavioral;
