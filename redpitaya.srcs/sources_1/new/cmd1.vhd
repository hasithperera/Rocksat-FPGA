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
  -- tmp: out std_logic_vector(32-1 downto 0) -- TB definition
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

component pwm_ahe is
Generic ( n : NATURAL := 32 );
Port ( 
    clk: in std_logic;
    en: in std_logic;
    duty: in std_logic_vector(n-1 downto 0);
    freq: in std_logic_vector(n-1 downto 0);
    y: out std_logic
   -- tmp: out std_logic_vector(n-1 downto 0) -- test out
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

signal tmp_cnt: std_logic_vector(32-1 downto 0);
signal tmp_rst: std_logic;
signal duty_pwm0: std_logic_vector(32-1 downto 0);

begin

cntr_0: cntr_ahe generic map(32)
port map(clk => clk,
rst => '0',
cnt => tmp_cnt
);

-- debug leds1 - works (5/3/24)
led(7 downto 4) <= tmp_cnt(3 downto 0);
led(3 downto 0) <= python_led_data(3 downto 0);

--led <= duty_pwm0(7 downto 0);

-- confirm operation of pins
--pwm1 <= tmp_cnt(8);
--pwm2 <= tmp_cnt(9);

--led <= duty_pwm0(7 downto 0);

mux_3: mux_ahe generic map(32) 
port map(
x0 => x"0002A3d7",
x1 => x"0002bccc",
x2 => x"00028333",
x3 => x"0002a3d7",
---- TB sim values
--x0 => x"0000000E",
--x1 => x"00000008",
--x2 => x"00000005",
--x3 => x"00000001",
en => '1',
s => python_led_data(2 downto 1),
y => duty_pwm0
);


pwm3_uut: pwm_ahe generic map(32)
port map(
clk => clk,
en =>  '1',
duty => duty_pwm0,
--freq => x"0000000f", -- for TB use
freq => x"00258000",
y => pwm2
);


--pwm1_uut: pwm_ahe generic map(32)
--port map(
--clk => clk,
--en =>  '1',
--duty => duty_pwm0 ,
--freq => x"00025800",
--y => pwm1
--);

--pwm2_uut: pwm_ahe generic map(32)
--port map(
--clk => clk,
--en =>  '1',
--duty => duty_pwm0 ,
--freq => x"00025800",
--y => pwm2
--);

end Behavioral;
