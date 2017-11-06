entity counter2 is
-- декларация 3-разрядной выходной шины COUNT путем
-- указания пределов возможных изменений (от 0 до 7)
-- данных типа NATURAL
port (start, clk : in bit;
count : out natural range 0 to 7);
end counter2;
architecture example of counter2 is
begin
process (clk)
-- в связи с тем, что внутри оператора процесса
-- не могут декларироваться сигналы (см. 6.8), вводится
-- вспомогательная переменная - аналог состояния
-- выходной шины COUNT
variable number : natural range 0 to 7;
-- переменная, единичное значение которой будет
-- использоваться как признак появления сигнала START
variable push : bit;
begin
if (clk'event and clk = '1') then -- строка с записью
-- условия формирования фронта положительного
-- тактового импульса
if (start = '1') then
push := '1';
end if;
if (push = '1') then
number := number + 1;
else
number := 0; -- сброс (обнуление) счетчика
end if;
if (number = 7) then
push := '0';
end if;
end if;
count <= number;
end process;
end example;