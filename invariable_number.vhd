library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity invariable_number is
port(
clk:in std_logic;
--clear:in std_logic;
cout:out std_logic_vector(6 downto 0);
dout:out std_logic_vector(7 downto 0);
data:in std_logic_vector(23 downto 0);
guan:in std_logic_vector(2 downto 0)
--mode:in std_logic
);
end invariable_number;

architecture example of invariable_number is
signal clk_out:std_logic;
signal tmp:integer range 0 to 100000;
signal num:std_logic_vector(3 downto 0);
signal num1:std_logic_vector(6 downto 0);
signal num2:std_logic_vector(6 downto 0);
signal num3:std_logic_vector(6 downto 0);
signal num4:std_logic_vector(6 downto 0);
signal num5:std_logic_vector(6 downto 0);
signal num6:std_logic_vector(6 downto 0);
signal num7:std_logic_vector(6 downto 0);
begin
p1:process(clk)
begin
--if(clear='1') then tmp<=0;
--elsif (clk'event and clk='1') then 
if (clk'event and clk='1') then 
if(tmp=100000) then tmp<=0;
--if(tmp=2) then tmp<=0;
else tmp<=tmp+1;
end if;
end if;
--end if;
end process;

p2:process(clk,data,guan)
begin
if(clk'event and clk='1')then 
if(tmp>50000) then clk_out<='1';
--if(tmp>1) then clk_out<='1';
else clk_out<='0';
end if;
end if;

--if(mode='0')then
--第一位数码管
case data(3 downto 0) is
when "0000"=>num1<="1111110";--0
when "0001"=>num1<="0110000";--1
when "0010"=>num1<="1101101";--2
when "0011"=>num1<="1111001";--3
when "0100"=>num1<="0110011";--4
when "0101"=>num1<="1011011";--5
when "0110"=>num1<="1011111";--6
when "0111"=>num1<="1110000";--7
when "1000"=>num1<="1111111";--8
when "1001"=>num1<="1111011";--9
when others=>num1<="0000000";--不显示
end case;

--第二位数码管
case data(7 downto 4) is
when "0000"=>num2<="1111110";--0
when "0001"=>num2<="0110000";--1
when "0010"=>num2<="1101101";--2
when "0011"=>num2<="1111001";--3
when "0100"=>num2<="0110011";--4
when "0101"=>num2<="1011011";--5
when "0110"=>num2<="1011111";--6
when "0111"=>num2<="1110000";--7
when "1000"=>num2<="1111111";--8
when "1001"=>num2<="1111011";--9
when others=>num2<="0000000";--不显示
end case;

--第三位数码管
case data(11 downto 8) is
when "0000"=>num3<="1111110";--0
when "0001"=>num3<="0110000";--1
when "0010"=>num3<="1101101";--2
when "0011"=>num3<="1111001";--3
when "0100"=>num3<="0110011";--4
when "0101"=>num3<="1011011";--5
when "0110"=>num3<="1011111";--6
when "0111"=>num3<="1110000";--7
when "1000"=>num3<="1111111";--8
when "1001"=>num3<="1111011";--9
when others=>num3<="0000000";--不显示
end case;

--第四位数码管
case data(15 downto 12) is
when "0000"=>num4<="1111110";--0
when "0001"=>num4<="0110000";--1
when "0010"=>num4<="1101101";--2
when "0011"=>num4<="1111001";--3
when "0100"=>num4<="0110011";--4
when "0101"=>num4<="1011011";--5
when "0110"=>num4<="1011111";--6
when "0111"=>num4<="1110000";--7
when "1000"=>num4<="1111111";--8
when "1001"=>num4<="1111011";--9
when others=>num4<="0000000";--不显示
end case;

--第五位数码管
case data(19 downto 16) is
when "0000"=>num5<="1111110";--0
when "0001"=>num5<="0110000";--1
when "0010"=>num5<="1101101";--2
when "0011"=>num5<="1111001";--3
when "0100"=>num5<="0110011";--4
when "0101"=>num5<="1011011";--5
when "0110"=>num5<="1011111";--6
when "0111"=>num5<="1110000";--7
when "1000"=>num5<="1111111";--8
when "1001"=>num5<="1111011";--9
when others=>num5<="0000000";--不显示
end case;

--第六位数码管
case data(23 downto 20) is
when "0000"=>num6<="1111110";--0
when "0001"=>num6<="0110000";--1
when "0010"=>num6<="1101101";--2
when "0011"=>num6<="1111001";--3
when "0100"=>num6<="0110011";--4
when "0101"=>num6<="1011011";--5
when "0110"=>num6<="1011111";--6
when "0111"=>num6<="1110000";--7
when "1000"=>num6<="1111111";--8
when "1001"=>num6<="1111011";--9
when others=>num6<="0000000";--不显示
end case;

--else
--
--if(guan="001")then
----第一位数码管
--case data(7 downto 4) is
--when "0000"=>num1<="1111110";--0
--when "0001"=>num1<="0110000";--1
--when "0010"=>num1<="1101101";--2
--when "0011"=>num1<="1111001";--3
--when "0100"=>num1<="0110011";--4
--when "0101"=>num1<="1011011";--5
--when "0110"=>num1<="1011111";--6
--when "0111"=>num1<="1110000";--7
--when "1000"=>num1<="1111111";--8
--when "1001"=>num1<="1111011";--9
--when others=>num1<="0000000";--不显示
--end case;
--
----第二位数码管
--case data(11 downto 8) is
--when "0000"=>num2<="1111110";--0
--when "0001"=>num2<="0110000";--1
--when "0010"=>num2<="1101101";--2
--when "0011"=>num2<="1111001";--3
--when "0100"=>num2<="0110011";--4
--when "0101"=>num2<="1011011";--5
--when "0110"=>num2<="1011111";--6
--when "0111"=>num2<="1110000";--7
--when "1000"=>num2<="1111111";--8
--when "1001"=>num2<="1111011";--9
--when others=>num2<="0000000";--不显示
--end case;
--
----第三位数码管
--case data(3 downto 0) is
--when "0000"=>num3<="1111110";--0
--when "0001"=>num3<="0110000";--1
--when "0010"=>num3<="1101101";--2
--when "0011"=>num3<="1111001";--3
--when "0100"=>num3<="0110011";--4
--when "0101"=>num3<="1011011";--5
--when "0110"=>num3<="1011111";--6
--when "0111"=>num3<="1110000";--7
--when "1000"=>num3<="1111111";--8
--when "1001"=>num3<="1111011";--9
--when others=>num3<="0000000";--不显示
--end case;
--
----第四位数码管
--case data(19 downto 16) is
--when "0000"=>num4<="1111110";--0
--when "0001"=>num4<="0110000";--1
--when "0010"=>num4<="1101101";--2
--when "0011"=>num4<="1111001";--3
--when "0100"=>num4<="0110011";--4
--when "0101"=>num4<="1011011";--5
--when "0110"=>num4<="1011111";--6
--when "0111"=>num4<="1110000";--7
--when "1000"=>num4<="1111111";--8
--when "1001"=>num4<="1111011";--9
--when others=>num4<="0000000";--不显示
--end case;
--
----第五位数码管
--case data(15 downto 12) is
--when "0000"=>num5<="1111110";--0
--when "0001"=>num5<="0110000";--1
--when "0010"=>num5<="1101101";--2
--when "0011"=>num5<="1111001";--3
--when "0100"=>num5<="0110011";--4
--when "0101"=>num5<="1011011";--5
--when "0110"=>num5<="1011111";--6
--when "0111"=>num5<="1110000";--7
--when "1000"=>num5<="1111111";--8
--when "1001"=>num5<="1111011";--9
--when others=>num5<="0000000";--不显示
--end case;
--
----第六位数码管
--case data(23 downto 20) is
--when "0000"=>num6<="1111110";--0
--when "0001"=>num6<="0110000";--1
--when "0010"=>num6<="1101101";--2
--when "0011"=>num6<="1111001";--3
--when "0100"=>num6<="0110011";--4
--when "0101"=>num6<="1011011";--5
--when "0110"=>num6<="1011111";--6
--when "0111"=>num6<="1110000";--7
--when "1000"=>num6<="1111111";--8
--when "1001"=>num6<="1111011";--9
--when others=>num6<="0000000";--不显示
--end case;
--
--elsif(guan="010")then
--
----第一位数码管
--case data(11 downto 8) is
--when "0000"=>num1<="1111110";--0
--when "0001"=>num1<="0110000";--1
--when "0010"=>num1<="1101101";--2
--when "0011"=>num1<="1111001";--3
--when "0100"=>num1<="0110011";--4
--when "0101"=>num1<="1011011";--5
--when "0110"=>num1<="1011111";--6
--when "0111"=>num1<="1110000";--7
--when "1000"=>num1<="1111111";--8
--when "1001"=>num1<="1111011";--9
--when others=>num1<="0000000";--不显示
--end case;
--
----第二位数码管
--case data(15 downto 12) is
--when "0000"=>num2<="1111110";--0
--when "0001"=>num2<="0110000";--1
--when "0010"=>num2<="1101101";--2
--when "0011"=>num2<="1111001";--3
--when "0100"=>num2<="0110011";--4
--when "0101"=>num2<="1011011";--5
--when "0110"=>num2<="1011111";--6
--when "0111"=>num2<="1110000";--7
--when "1000"=>num2<="1111111";--8
--when "1001"=>num2<="1111011";--9
--when others=>num2<="0000000";--不显示
--end case;
--
----第三位数码管
--case data(19 downto 16) is
--when "0000"=>num3<="1111110";--0
--when "0001"=>num3<="0110000";--1
--when "0010"=>num3<="1101101";--2
--when "0011"=>num3<="1111001";--3
--when "0100"=>num3<="0110011";--4
--when "0101"=>num3<="1011011";--5
--when "0110"=>num3<="1011111";--6
--when "0111"=>num3<="1110000";--7
--when "1000"=>num3<="1111111";--8
--when "1001"=>num3<="1111011";--9
--when others=>num3<="0000000";--不显示
--end case;
--
----第四位数码管
--case data(3 downto 0) is
--when "0000"=>num4<="1111110";--0
--when "0001"=>num4<="0110000";--1
--when "0010"=>num4<="1101101";--2
--when "0011"=>num4<="1111001";--3
--when "0100"=>num4<="0110011";--4
--when "0101"=>num4<="1011011";--5
--when "0110"=>num4<="1011111";--6
--when "0111"=>num4<="1110000";--7
--when "1000"=>num4<="1111111";--8
--when "1001"=>num4<="1111011";--9
--when others=>num4<="0000000";--不显示
--end case;
--
----第五位数码管
--case data(7 downto 4) is
--when "0000"=>num5<="1111110";--0
--when "0001"=>num5<="0110000";--1
--when "0010"=>num5<="1101101";--2
--when "0011"=>num5<="1111001";--3
--when "0100"=>num5<="0110011";--4
--when "0101"=>num5<="1011011";--5
--when "0110"=>num5<="1011111";--6
--when "0111"=>num5<="1110000";--7
--when "1000"=>num5<="1111111";--8
--when "1001"=>num5<="1111011";--9
--when others=>num5<="0000000";--不显示
--end case;
--
----第六位数码管
--case data(23 downto 20) is
--when "0000"=>num6<="1111110";--0
--when "0001"=>num6<="0110000";--1
--when "0010"=>num6<="1101101";--2
--when "0011"=>num6<="1111001";--3
--when "0100"=>num6<="0110011";--4
--when "0101"=>num6<="1011011";--5
--when "0110"=>num6<="1011111";--6
--when "0111"=>num6<="1110000";--7
--when "1000"=>num6<="1111111";--8
--when "1001"=>num6<="1111011";--9
--when others=>num6<="0000000";--不显示
--end case;
--
--else
--
----第一位数码管
--case data(23 downto 20) is
--when "0000"=>num1<="1111110";--0
--when "0001"=>num1<="0110000";--1
--when "0010"=>num1<="1101101";--2
--when "0011"=>num1<="1111001";--3
--when "0100"=>num1<="0110011";--4
--when "0101"=>num1<="1011011";--5
--when "0110"=>num1<="1011111";--6
--when "0111"=>num1<="1110000";--7
--when "1000"=>num1<="1111111";--8
--when "1001"=>num1<="1111011";--9
--when others=>num1<="0000000";--不显示
--end case;
--
----第二位数码管
--case data(15 downto 12) is
--when "0000"=>num2<="1111110";--0
--when "0001"=>num2<="0110000";--1
--when "0010"=>num2<="1101101";--2
--when "0011"=>num2<="1111001";--3
--when "0100"=>num2<="0110011";--4
--when "0101"=>num2<="1011011";--5
--when "0110"=>num2<="1011111";--6
--when "0111"=>num2<="1110000";--7
--when "1000"=>num2<="1111111";--8
--when "1001"=>num2<="1111011";--9
--when others=>num2<="0000000";--不显示
--end case;
--
----第三位数码管
--case data(19 downto 16) is
--when "0000"=>num3<="1111110";--0
--when "0001"=>num3<="0110000";--1
--when "0010"=>num3<="1101101";--2
--when "0011"=>num3<="1111001";--3
--when "0100"=>num3<="0110011";--4
--when "0101"=>num3<="1011011";--5
--when "0110"=>num3<="1011111";--6
--when "0111"=>num3<="1110000";--7
--when "1000"=>num3<="1111111";--8
--when "1001"=>num3<="1111011";--9
--when others=>num3<="0000000";--不显示
--end case;
--
----第四位数码管
--case data(7 downto 4) is
--when "0000"=>num4<="1111110";--0
--when "0001"=>num4<="0110000";--1
--when "0010"=>num4<="1101101";--2
--when "0011"=>num4<="1111001";--3
--when "0100"=>num4<="0110011";--4
--when "0101"=>num4<="1011011";--5
--when "0110"=>num4<="1011111";--6
--when "0111"=>num4<="1110000";--7
--when "1000"=>num4<="1111111";--8
--when "1001"=>num4<="1111011";--9
--when others=>num4<="0000000";--不显示
--end case;
--
----第五位数码管
--case data(3 downto 0) is
--when "0000"=>num5<="1111110";--0
--when "0001"=>num5<="0110000";--1
--when "0010"=>num5<="1101101";--2
--when "0011"=>num5<="1111001";--3
--when "0100"=>num5<="0110011";--4
--when "0101"=>num5<="1011011";--5
--when "0110"=>num5<="1011111";--6
--when "0111"=>num5<="1110000";--7
--when "1000"=>num5<="1111111";--8
--when "1001"=>num5<="1111011";--9
--when others=>num5<="0000000";--不显示
--end case;
--
----第六位数码管
--case data(11 downto 8) is
--when "0000"=>num6<="1111110";--0
--when "0001"=>num6<="0110000";--1
--when "0010"=>num6<="1101101";--2
--when "0011"=>num6<="1111001";--3
--when "0100"=>num6<="0110011";--4
--when "0101"=>num6<="1011011";--5
--when "0110"=>num6<="1011111";--6
--when "0111"=>num6<="1110000";--7
--when "1000"=>num6<="1111111";--8
--when "1001"=>num6<="1111011";--9
--when others=>num6<="0000000";--不显示
--end case;
--
--end if;
--
--
--end if;

--关卡
case guan is
when "001"=>num7<="0110000";--1
when "010"=>num7<="1101101";--2
when "011"=>num7<="1111001";--3
when "000"=>num7<="1111110";--0
when others=>num7<="0000000";--不显示
end case;

end process;

--p3:process(clear,clk_out)
p3:process(clk_out)
begin 
if(clk_out'event and clk_out='1') then
--if(clear='1' or num="0111") then
if(num="0111") then
num<="0000";
else
num<=num+1;
end if;
end if;
end process;

p4:process(num,num1,num2,num3,num4,num5,num6,num7)
begin 
case num is
when "0000"=>cout<=num7;dout<="01111111";
when "0001"=>cout<="0000000";dout<="10111111";
when "0010"=>cout<=num6;dout<="11011111";
when "0011"=>cout<=num5;dout<="11101111";
when "0100"=>cout<=num4;dout<="11110111";
when "0101"=>cout<=num3;dout<="11111011";
when "0110"=>cout<=num2;dout<="11111101";
when "0111"=>cout<=num1;dout<="11111110";
when others=>cout<="0000000";dout<="11111111";
end case;
end process;
end;