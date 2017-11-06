entity kcc is
port (count : in natural range 0 to 7;
outg : out integer range -8 to +7);
end kcc;
architecture ind of kcc is
begin
process (count)
begin
case count is
when 0 => outg <= 0;
when 1 => outg <= -1;
when 2 => outg <= -1;
when 3 => outg <= +1;
when 4 => outg <= -1;
when 5 => outg <= -1;
when 6 => outg <= +1;
when 7 => outg <= +1;
end case;
end process;
end ind;