----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2024 11:17:05 AM
-- Design Name: 
-- Module Name: mux_ahe - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_ahe is
Generic ( n : NATURAL := 32 );
Port ( 
    clk: in std_logic;
    en: in std_logic;
    duty: in std_logic_vector(n-1 downto 0);
    freq: in std_logic_vector(n-1 downto 0);
    y: out std_logic
   -- tmp: out std_logic_vector(n-1 downto 0) -- test out
);
end pwm_ahe;

architecture Behavioral of pwm_ahe is

signal cnt: std_logic_vector(n-1 downto 0):= (others => '0');
signal y_tmp: std_logic:='0';
begin

process(clk,duty,freq)
begin

if (clk'event AND clk = '1') then
        if (cnt < freq) then
            cnt <= cnt + 1;
            if (cnt < duty) then
                y_tmp <= '1';
            else
                y_tmp <='0';
            end if;
        else
            cnt <= (others => '0');
        end if;
end if;

end process;
y <= y_tmp;


end Behavioral;
