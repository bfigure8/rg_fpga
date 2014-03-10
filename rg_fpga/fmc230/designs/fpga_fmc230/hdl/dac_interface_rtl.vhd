-------------------------------------------------------------------------------
-- Title      :                             
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dac_interface_rtl.vhd
-- Author     : steel_lake
-- Company    : Rohde & Schwarz
-- Last update: 
-- Platform   : PC
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date         Version     Author      Description
-- 10/09/2014   1.0         bfigure8    Created
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity dac_interface is
    generic (
        DAC_WIDTH : positive := 14
    )        
    port (
        i_clk       : in std_logic;
        i_reset     : in std_logic;
        i_data_in   : in std_logic_vector(DAC_WIDTH-1 downto 0);
        i_data_out  : out std_logic_vector(DAC_WIDTH-1 downto 0)
    );                
end entity dac_interface;
--
architecture rtl of dac_interface is
begin
    
    p_dac : process(i_clk, i_reset)
    begin
        if i_reset = '1' then
            o_data_out <= (others => '0');
        elsif rising_edge(i_clk) then
            o_data_out <= i_data_in;
        end if;
    end process;            
            
end architecture rtl;

