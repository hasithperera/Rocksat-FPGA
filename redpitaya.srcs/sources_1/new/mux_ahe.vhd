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

entity mux_ahe is
GENERIC ( n : NATURAL := 32 );
Port ( 
x0,x1,x2,x3: in std_logic_vector(n-1 downto 0);
s: in std_logic_vector(2-1 downto 0):="00";
en: in std_logic;
y: out std_logic_vector(n-1 downto 0)
);
end mux_ahe;

architecture Behavioral of mux_ahe is
signal tmp_y: std_logic_vector(3-1 downto 0);
begin
    tmp_y <= en & s;
    with tmp_y select y <=
        x0 when "100",
        x1 when  "101",
        x2 when "110",
        x3 when "111",
        (OTHERS => '0') when others;
end Behavioral;
