entity generator3 is
port (start, clk : in bit;
outg : out integer range -8 to +7);
end generator3;
architecture example of generator3 is
begin
process (clk)
-- декларация 2-битной переменной, которая вводится в
-- связи с совпадением значений (+1 или -1) отдельных
-- элементов генерируемого сигнала и моделирует
-- некоторый 3-разрядный счетчик номеров восьми 
-- состояний выходной шины генератора
variable count : natural range 0 to 7;
variable result : integer range -8 to +7 := 0;
variable push : bit;
begin
if (clk'event and clk = '1') then
if (start = '1') then
push := '1';
end if;
if (push = '1') then
count := count + 1;
else
count := 0;
end if;
case count is
when 0 => result := 0;
when 1 => result := -1;
when 2 => result := -1;
when 3 => result := +1;
when 4 => result := -1;
when 5 => result := -1;
when 6 => result := +1;
when 7 => result := +1;
end case;
if (count = 7) then
push := '0'; -- обеспечение готовности к реакции
-- на новый сигнал START
end if;
end if;
outg <= result;
end process;
end example;
