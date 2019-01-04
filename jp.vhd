library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity jp is
    Port (
			CLK  			  :in std_logic;                    --时钟信号	
			row               :in std_logic_vector(3 downto 0);
			num               :out std_logic_vector(3 downto 0);
			anxia              :out std_logic;
			col               :out std_logic_vector(3 downto 0)
			
		 );		    
end jp;

architecture jp of jp is

	signal scol :std_logic_vector(3 downto 0);
	signal lastrow :std_logic_vector(3 downto 0);
	signal snum :std_logic_vector(3 downto 0);
	signal ganzhi :std_logic;
	signal s_anxia :std_logic;
	signal flag :std_logic;
	signal go :std_logic;
	
		  
begin
----------------------------------------------------
	
	
	process(CLK)	
		variable count: integer range 0 to 6000000;
--      variable count: integer range 0 to 4;
		variable delay: integer range 0 to 50000000;
		variable i: integer range 0 to 3;
		variable r: integer range 0 to 3;
		variable c: integer range 0 to 3;
	begin
	
		if CLK'event and CLK='1'then	
			count := count + 1;
			if count=0 then
				i := i + 1;
			end if;                                        --分频器
			
			case i is                                      --列扫描
				when 0 => scol<="1110"; 
				when 1 => scol<="1101"; 
				when 2 => scol<="1011"; 
				when 3 => scol<="0111"; 
			end case;
			
			lastrow <= row;
			
			if row<"1111" and row<lastrow then            --表示按下且和上一个时钟周期没按下
				ganzhi <= '1';
			end if;
			
			    if ganzhi='1' then
					delay := delay + 1;
						case scol is
							when "1110" => c:=0;
							when "1101" => c:=1;
							when "1011" => c:=2;
							when "0111" => c:=3;
							when others => c:=c;
						end case;
						case row is
							when "1110" => r:=0;
							when "1101" => r:=1;
							when "1011" => r:=2;
							when "0111" => r:=3;
							when others => r:=r;
						end case;
					if delay>1000000 then                  --通过延时防止按键抖动
--					if delay>10000000 then
							if row<"1111" then
							delay := 0;
							s_anxia <= '1';                --确认按下一次键
							snum <= conv_std_logic_vector((r*4+c) , 4);
							end if;
							ganzhi <= '0'; 
					end if;
				else
					delay := 0;
				end if;	
				
				if s_anxia='1' then
					s_anxia <= '0';
				end if;
		
		end if;
	end	process;
	
------------------------------------------------
	num <= snum;
	col <= scol;
	anxia <= s_anxia;
-------------------------------------------------
	
end jp;