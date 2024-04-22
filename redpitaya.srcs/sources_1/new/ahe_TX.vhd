----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 02:24:29 PM
-- Design Name: 
-- Module Name: ahe_TX - Behavioral
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

-- build to encapulate the counter data

entity ahe_TX is
  Port ( 
      clk: in std_logic;
     -- rnd_in: in std_logic_vector(14-1 downto 0);
      rnd_out: out std_logic_vector(14-1 downto 0)
  );
  
end ahe_TX;

architecture Behavioral of ahe_TX is

-- sub components
component cntr_ahe is
GENERIC ( n : NATURAL := 32 );
Port ( 
clk: in std_logic;
cnt: out std_logic_vector(n-1 downto 0);
rst: in std_logic
);
end component;

begin

cntr_1: cntr_ahe generic map(14)
port map(clk => clk,
rst => '0',
cnt => rnd_out
);

--rnd_out <= rnd_in;


end Behavioral;
