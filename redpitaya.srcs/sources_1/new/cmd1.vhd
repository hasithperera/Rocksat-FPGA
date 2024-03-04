----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2024 05:56:45 PM
-- Design Name: 
-- Module Name: cmd1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmd1 is
Port ( 
  clk: in std_logic;
  python_led_data: in std_logic_vector(7 downto 0);
  led: out std_logic_vector(7 downto 0);
  pwm0,pwm1,pwm2: out std_logic
 );
end cmd1;

architecture Behavioral of cmd1 is

component cntr_ahe is
GENERIC ( n : NATURAL := 32 );
Port ( 
clk: in std_logic;
cnt: out std_logic_vector(n-1 downto 0);
rst: in std_logic
);
end component;

signal tmp_cnt: std_logic_vector(32-1 downto 0);
signal tmp_rst: std_logic;

begin

cntr_0: cntr_ahe generic map(32)
port map(clk => clk,
rst => python_led_data(0),
cnt => tmp_cnt
);
led <= tmp_cnt(28 downto 21);
pwm0 <= tmp_cnt(0);
pwm1 <= tmp_cnt(8);
pwm2 <= tmp_cnt(21);

end Behavioral;
