entity counter2 is
-- ���������� 3-��������� �������� ���� COUNT �����
-- �������� �������� ��������� ��������� (�� 0 �� 7)
-- ������ ���� NATURAL
port (start, clk : in bit;
count : out natural range 0 to 7);
end counter2;
architecture example of counter2 is
begin
process (clk)
-- � ����� � ���, ��� ������ ��������� ��������
-- �� ����� ��������������� ������� (��. 6.8), ��������
-- ��������������� ���������� - ������ ���������
-- �������� ���� COUNT
variable number : natural range 0 to 7;
-- ����������, ��������� �������� ������� �����
-- �������������� ��� ������� ��������� ������� START
variable push : bit;
begin
if (clk'event and clk = '1') then -- ������ � �������
-- ������� ������������ ������ ��������������
-- ��������� ��������
if (start = '1') then
push := '1';
end if;
if (push = '1') then
number := number + 1;
else
number := 0; -- ����� (���������) ��������
end if;
if (number = 7) then
push := '0';
end if;
end if;
count <= number;
end process;
end example;