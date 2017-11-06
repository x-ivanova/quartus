entity generator2 is
port (start, clk : in bit;
outg : out integer range -8 to +7);
end generator2;
architecture exe of generator2 is
component counter2
port (start, clk : in bit;
count : out natural range 0 to 7);
end component;
component kcc
port (count : in natural range 0 to 7;
outg : out integer range -8 to +7);
end component;
signal F : natural range 0 to 7;
begin
a0 : counter2 port map (start, clk, F);
a1 : kcc port map (F, outg);
end exe;