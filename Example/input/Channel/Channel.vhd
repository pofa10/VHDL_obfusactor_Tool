-- Hesan Project - Pulse Detector V2 - Averaging
-- Design By: Pourya Farrokhi
-- Bahman 1400

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use work.HesanPKG.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Channel is
    generic (
        g_DetectionTime : INTEGER := 1; -- 'til 500 (in miliseconds)
        g_Power2Ratio   : INTEGER := 4 -- Ratio of Background Time To Detection Time (4 to 6) => (16,32,64)
    );
    Port (
        i_CLK          : in  STD_LOGIC;
        i_Reset_rst    : in  STD_LOGIC;
        i_Pulse_tdata  : in  STD_LOGIC;
        o_Detect_tflag : out STD_LOGIC
    );
end Channel;


architecture Behavioral of Channel is

    -- Moving to Pkg
    CONSTANT c_CLKPeriod    : INTEGER := 10;
    CONSTANT c_OBS_timeInt  : INTEGER := (g_DetectionTime * 1_000_000 / c_CLKPeriod);
    CONSTANT c_BKGD_timeInt : INTEGER := (2**g_Power2Ratio);
    --------------------------------------
    SIGNAL s_Pulse_tdata      : STD_LOGIC := '0';
    SIGNAL s_PulseBuff_tdata  : STD_LOGIC := '0';
    SIGNAL s_REdgePulse_tflag : STD_LOGIC := '0';


    SIGNAL s_BKGD_Cntr_tdata : UNSIGNED (7 downto 0)  := (others => '0');
    SIGNAL s_OBS_Cntr_tdata  : UNSIGNED (31 downto 0) := (others => '0');

    --- CONSTANTS
    SIGNAL c_BKGD_time : UNSIGNED (7 downto 0)  := (others => '0');
    SIGNAL c_OBS_time  : UNSIGNED (31 downto 0) := (others => '0');

    SIGNAL s_PulseCntr_tdata        : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL s_BKGD_PulseCnt_tdata    : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL s_BKGD_AvgPulse_tdata    : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL s_OBS_PulseCnt_tdata     : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL s_BKGD_ThrAvgPulse_tdata : UNSIGNED (15 downto 0) := (others => '0');
    SIGNAL s_SetupTime_tdata        : UNSIGNED (1 downto 0)  := (others => '0');

    -- Flags
    SIGNAL s_OBS_Done_tflag  : STD_LOGIC := '0';
    SIGNAL s_BKGD_Done_tflag : STD_LOGIC := '0';
    SIGNAL s_Detect_tflag    : STD_LOGIC := '0';

    --//--------- STATE MACHINE SIGNALs -----------
    -- State Machine
    type t_Mode_state is (init_st,Comparison_st);
    SIGNAL s_per_state : t_Mode_state := init_st;


begin

    PulseCntr_proc0 : process(i_CLK)
    begin

        if (i_Reset_rst = '1') then
            s_BKGD_Cntr_tdata     <= (others => '0');
            s_BKGD_AvgPulse_tdata <= (others => '0');
            s_PulseCntr_tdata     <= (others => '0');
            s_per_state           <= init_st;


        elsif rising_edge(i_CLK) then

            -- Input Signal Buffering
            s_PulseBuff_tdata <= s_Pulse_tdata;

            -- "observer" Counter Started
            s_OBS_Cntr_tdata <= s_OBS_Cntr_tdata + 1;

            -- Flags
            s_OBS_Done_tflag  <= '0';
            s_BKGD_Done_tflag <= '0';

            if (s_REdgePulse_tflag = '1') then
                s_PulseCntr_tdata <= s_PulseCntr_tdata + 1;
            end if;

            if (s_BKGD_Cntr_tdata = c_BKGD_time) then

                s_BKGD_Done_tflag <= '1';
                case g_Power2Ratio is
                    when 4 =>
                        s_BKGD_AvgPulse_tdata <= x"0" & s_BKGD_PulseCnt_tdata(15 downto g_Power2Ratio);

                    when 5 =>
                        s_BKGD_AvgPulse_tdata <= "00000" & s_BKGD_PulseCnt_tdata(15 downto g_Power2Ratio);

                    when 6 =>
                        s_BKGD_AvgPulse_tdata <= "000000" & s_BKGD_PulseCnt_tdata(15 downto g_Power2Ratio);

                    when others =>
                        Null;

                end case;

                s_BKGD_PulseCnt_tdata <= (others => '0');
                s_BKGD_Cntr_tdata     <= (others => '0');

            elsif (s_OBS_Cntr_tdata = c_OBS_time) then

                s_OBS_Done_tflag     <= '1';
                s_OBS_PulseCnt_tdata <= s_PulseCntr_tdata;
                ---------- BACKGROUND CALCULATIONs -----------------
                s_BKGD_Cntr_tdata     <= s_BKGD_Cntr_tdata + 1;
                s_BKGD_PulseCnt_tdata <= s_BKGD_PulseCnt_tdata + s_OBS_PulseCnt_tdata;
                -----------------------------------------------------
                s_OBS_Cntr_tdata  <= (others => '0');
                s_PulseCntr_tdata <= (others => '0');

            end if;

            case s_per_state is
                when init_st =>
                    if (s_SetupTime_tdata = "10") then
                        s_per_state <= Comparison_st;
                    elsif (s_BKGD_Done_tflag = '1') then
                        s_SetupTime_tdata <= s_SetupTime_tdata + 1;
                        s_per_state       <= init_st;
                    else
                        s_per_state <= init_st;
                    end if;

                when Comparison_st =>
                    --if (s_OBS_Done_tflag = '1') AND (s_OBS_PulseCnt_tdata > s_BKGD_AvgPulse_tdata) then -- Without Threshold
                    if (s_OBS_Done_tflag = '1') AND (s_OBS_PulseCnt_tdata > s_BKGD_ThrAvgPulse_tdata) then
                        s_Detect_tflag <= '1';
                    else
                        s_Detect_tflag <= '0';
                    end if;
            end case;


        end if;
    end process;

    --- Addition 12.5% of s_BKGD_AvgPulse_tdata to itself
    -- For having a better threshold
    s_BKGD_ThrAvgPulse_tdata <= s_BKGD_AvgPulse_tdata + ("000" & s_BKGD_AvgPulse_tdata(15 downto 3));

    -- Rising Edge Pulse Detector
    s_REdgePulse_tflag <= NOT(s_PulseBuff_tdata) AND s_Pulse_tdata;

    ---- Converter
    c_BKGD_time <= to_unsigned(c_BKGD_timeInt,c_BKGD_time'length);
    c_OBS_time  <= to_unsigned(c_OBS_timeInt,c_OBS_time'length);

    --- I/O Connection
    s_Pulse_tdata  <= i_Pulse_tdata;
    o_Detect_tflag <= s_Detect_tflag;

end Behavioral;
