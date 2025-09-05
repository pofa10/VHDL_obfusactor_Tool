



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;








entity Channel is
    generic (
        ElqhWcCnRyNSZtaXUYBYjPsneyqHVC : INTEGER := 1; 
        QjMnmkPRAojftJOOPhIaFMcfwOFeqO   : INTEGER := 4 
    );
    Port (
        AhFpJhSxuRZxlhVTGeDFtUpcCqKYTi          : in  STD_LOGIC;
        nZJmDrPzfRShMYSClLhQREjwJQdthx    : in  STD_LOGIC;
        VYMvNgGIoSWHIahhYEpzLWeJtGAsjl  : in  STD_LOGIC;
        pgOWGeyFlmchddrLBvgDDEsSLppLzK : out STD_LOGIC
    );
end Channel;


architecture Behavioral of Channel is

    
    CONSTANT uwkMPkcPFGUxuUnOkmTMFLIqsOgjMq    : INTEGER := 10;
    CONSTANT BiMNwdhJGPmRjVdJHauXXSnNdfXbTw  : INTEGER := (ElqhWcCnRyNSZtaXUYBYjPsneyqHVC * 1_000_000 / uwkMPkcPFGUxuUnOkmTMFLIqsOgjMq);
    CONSTANT IyOQTrauNVCDkEocohAJMeExRPcfXf : INTEGER := (2**QjMnmkPRAojftJOOPhIaFMcfwOFeqO);
    
    SIGNAL PQDhjQkYhKEBKTWGHzTaBZnoImKWmL      : STD_LOGIC := '0';
    SIGNAL YXvfmAuxVxhCDBnXnSRpNrZGTkuDEU  : STD_LOGIC := '0';
    SIGNAL HnVCfwACGYUjuKWKQBDIjFaBTnxYgb : STD_LOGIC := '0';


    SIGNAL SJbdrENhjvUYVaJbyQSyUuihtBpmHS : UNSIGNED (7 downto 0)  := (others => '0');
    SIGNAL qNjanapjHsLiYnXWNqskoSlrrHzvXb  : UNSIGNED (31 downto 0) := (others => '0');

    
    SIGNAL RyBqoxwPNeKLoaBedHkrvstJpNQqyW : UNSIGNED (7 downto 0)  := (others => '0');
    SIGNAL iVmMLWWYMvCPKFjjzjCHQauCnOYQma  : UNSIGNED (31 downto 0) := (others => '0');

    SIGNAL fuxySTrIYxUSQuxgOovoRKKQcPtOfz        : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL lpFospvoTGYkWbuQiiYMxVVgtxGaTQ    : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL LXNYPHamUWlKvbZUrNkgRrhLxDxRMF    : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL rLkQoKTpJrmxkACMqpWhLBJitceQaD     : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL BTDboMxuwUHgXaOopteVVYNpAJQZWl : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL VUFTfcgCwLzCeLbvKQIEYPDlUvRoVD        : UNSIGNED (1 downto 0)  := (others => '0');

    
    SIGNAL MqPPCeCuVFHGApzLDJCSroQaWnrodr  : STD_LOGIC := '0';
    SIGNAL avqRNTtKkhcIPMlALOkcVcituyTxRK : STD_LOGIC := '0';
    SIGNAL jokIPJtUAacEwaaqjMXVOtxBNkebOd    : STD_LOGIC := '0';

    
    
    type uhUHwXcTESolfetLVbFDqbTBmEvPAc is (init_st,Comparison_st);
    SIGNAL vqnLvWekrgGvdcMrjlllHPGagINMQk : uhUHwXcTESolfetLVbFDqbTBmEvPAc := init_st;


begin

    PulseCntr_proc0 : process(AhFpJhSxuRZxlhVTGeDFtUpcCqKYTi)
    begin

        if (nZJmDrPzfRShMYSClLhQREjwJQdthx = '1') then
            SJbdrENhjvUYVaJbyQSyUuihtBpmHS     <= (others => '0');
            LXNYPHamUWlKvbZUrNkgRrhLxDxRMF <= (others => '0');
            fuxySTrIYxUSQuxgOovoRKKQcPtOfz     <= (others => '0');
            vqnLvWekrgGvdcMrjlllHPGagINMQk           <= init_st;


        elsif rising_edge(AhFpJhSxuRZxlhVTGeDFtUpcCqKYTi) then

            
            YXvfmAuxVxhCDBnXnSRpNrZGTkuDEU <= PQDhjQkYhKEBKTWGHzTaBZnoImKWmL;

            
            qNjanapjHsLiYnXWNqskoSlrrHzvXb <= qNjanapjHsLiYnXWNqskoSlrrHzvXb + 1;

            
            MqPPCeCuVFHGApzLDJCSroQaWnrodr  <= '0';
            avqRNTtKkhcIPMlALOkcVcituyTxRK <= '0';

            if (HnVCfwACGYUjuKWKQBDIjFaBTnxYgb = '1') then
                fuxySTrIYxUSQuxgOovoRKKQcPtOfz <= fuxySTrIYxUSQuxgOovoRKKQcPtOfz + 1;
            end if;

            if (SJbdrENhjvUYVaJbyQSyUuihtBpmHS = RyBqoxwPNeKLoaBedHkrvstJpNQqyW) then

                avqRNTtKkhcIPMlALOkcVcituyTxRK <= '1';
                case QjMnmkPRAojftJOOPhIaFMcfwOFeqO is
                    when 4 =>
                        LXNYPHamUWlKvbZUrNkgRrhLxDxRMF <= x"0" & lpFospvoTGYkWbuQiiYMxVVgtxGaTQ(15 downto QjMnmkPRAojftJOOPhIaFMcfwOFeqO);

                    when 5 =>
                        LXNYPHamUWlKvbZUrNkgRrhLxDxRMF <= "00000" & lpFospvoTGYkWbuQiiYMxVVgtxGaTQ(15 downto QjMnmkPRAojftJOOPhIaFMcfwOFeqO);

                    when 6 =>
                        LXNYPHamUWlKvbZUrNkgRrhLxDxRMF <= "000000" & lpFospvoTGYkWbuQiiYMxVVgtxGaTQ(15 downto QjMnmkPRAojftJOOPhIaFMcfwOFeqO);

                    when others =>
                        Null;

                end case;

                lpFospvoTGYkWbuQiiYMxVVgtxGaTQ <= (others => '0');
                SJbdrENhjvUYVaJbyQSyUuihtBpmHS     <= (others => '0');

            elsif (qNjanapjHsLiYnXWNqskoSlrrHzvXb = iVmMLWWYMvCPKFjjzjCHQauCnOYQma) then

                MqPPCeCuVFHGApzLDJCSroQaWnrodr     <= '1';
                rLkQoKTpJrmxkACMqpWhLBJitceQaD <= fuxySTrIYxUSQuxgOovoRKKQcPtOfz;
                
                SJbdrENhjvUYVaJbyQSyUuihtBpmHS     <= SJbdrENhjvUYVaJbyQSyUuihtBpmHS + 1;
                lpFospvoTGYkWbuQiiYMxVVgtxGaTQ <= lpFospvoTGYkWbuQiiYMxVVgtxGaTQ + rLkQoKTpJrmxkACMqpWhLBJitceQaD;
                
                qNjanapjHsLiYnXWNqskoSlrrHzvXb  <= (others => '0');
                fuxySTrIYxUSQuxgOovoRKKQcPtOfz <= (others => '0');

            end if;

            case vqnLvWekrgGvdcMrjlllHPGagINMQk is
                when init_st =>
                    if (VUFTfcgCwLzCeLbvKQIEYPDlUvRoVD = "10") then
                        vqnLvWekrgGvdcMrjlllHPGagINMQk <= Comparison_st;
                    elsif (avqRNTtKkhcIPMlALOkcVcituyTxRK = '1') then
                        VUFTfcgCwLzCeLbvKQIEYPDlUvRoVD <= VUFTfcgCwLzCeLbvKQIEYPDlUvRoVD + 1;
                        vqnLvWekrgGvdcMrjlllHPGagINMQk       <= init_st;
                    else
                        vqnLvWekrgGvdcMrjlllHPGagINMQk <= init_st;
                    end if;

                when Comparison_st =>
                    
                    if (MqPPCeCuVFHGApzLDJCSroQaWnrodr = '1') AND (rLkQoKTpJrmxkACMqpWhLBJitceQaD > BTDboMxuwUHgXaOopteVVYNpAJQZWl) then
                        jokIPJtUAacEwaaqjMXVOtxBNkebOd <= '1';
                    else
                        jokIPJtUAacEwaaqjMXVOtxBNkebOd <= '0';
                    end if;
            end case;


        end if;
    end process;

    
    
    BTDboMxuwUHgXaOopteVVYNpAJQZWl <= LXNYPHamUWlKvbZUrNkgRrhLxDxRMF + ("000" & LXNYPHamUWlKvbZUrNkgRrhLxDxRMF(15 downto 3));

    
    HnVCfwACGYUjuKWKQBDIjFaBTnxYgb <= NOT(YXvfmAuxVxhCDBnXnSRpNrZGTkuDEU) AND PQDhjQkYhKEBKTWGHzTaBZnoImKWmL;

    
    RyBqoxwPNeKLoaBedHkrvstJpNQqyW <= to_unsigned(IyOQTrauNVCDkEocohAJMeExRPcfXf,RyBqoxwPNeKLoaBedHkrvstJpNQqyW'length);
    iVmMLWWYMvCPKFjjzjCHQauCnOYQma  <= to_unsigned(BiMNwdhJGPmRjVdJHauXXSnNdfXbTw,iVmMLWWYMvCPKFjjzjCHQauCnOYQma'length);

    
    PQDhjQkYhKEBKTWGHzTaBZnoImKWmL  <= VYMvNgGIoSWHIahhYEpzLWeJtGAsjl;
    pgOWGeyFlmchddrLBvgDDEsSLppLzK <= jokIPJtUAacEwaaqjMXVOtxBNkebOd;

end Behavioral;
