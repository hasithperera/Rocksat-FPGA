----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2024 04:26:19 PM
-- Design Name: 
-- Module Name: cmd_ahe - Behavioral
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

entity cmd_ahe is
  Port ( 
  clk: in std_logic;
  python_led_data: in std_logic_vector(7 downto 0);
  led: out std_logic_vector(7 downto 0);
  pwm0,pwm1,pwm2: out std_logic
  );
end cmd_ahe;

architecture Behavioral of cmd_ahe is

component pwm_ahe is
Generic ( n : NATURAL := 32 );
Port ( 
    clk: in std_logic;
    en: in std_logic;
    clr: in std_logic;
    duty: in std_logic_vector(n-1 downto 0);
    freq: in std_logic_vector(n-1 downto 0);
    y: out std_logic
);
end component;

component mux_ahe is
GENERIC ( n : NATURAL := 32 );
Port ( 
x0,x1,x2,x3: in std_logic_vector(n-1 downto 0);
s: in std_logic_vector(2-1 downto 0);
en: in std_logic;
y: out std_logic_vector(n-1 downto 0)
);
end component;
--signal temp_data: std_logic_vector(7 downto 0);
signal pwm0_duty: std_logic_vector(31 downto 0);
begin

--temp_data <= python_led_data;
mux0: mux_ahe generic map(32) port map(
x0 => x"0007A120", -- .5e6
x1 => x"000B69E0", --748000
x2 => x"00012430", --74800
x3 => x"000F0000", -- a very high duty cycle
s => python_led_data(3 downto 2),
en => python_led_data(0),
y => pwm0_duty
);

pwm0_uut: pwm_ahe generic map(32)
port map(
clk => clk,
en => python_led_data(0),
clr => python_led_data(1),
duty => pwm0_duty,
freq => x"000F4240", --1e6
y => pwm0
);


led <= python_led_data;

end Behavioral;
