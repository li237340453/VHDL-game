library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity control is
    Port (
			CLK  			  :in std_logic;                    --时钟信号
			Num  			  :in std_logic_vector(3 downto 0); 
			anxia  			  :in std_logic;
			rData1            :in std_logic_vector(23 downto 0);
			dainzhen8x8           :out std_logic_vector(2 downto 0);
			guannum           :out std_logic_vector(2 downto 0);
			display1             :out std_logic_vector(23 downto 0);
			display2             :out std_logic_vector(23 downto 0);
			Start             :out std_logic;
			Start1            :out std_logic
		 );		    
end control;

architecture control of control is

	signal s_dianzhendata :std_logic_vector(2 downto 0);
	signal temporary1 :std_logic_vector(23 downto 0);
	signal temporary2 :std_logic_vector(23 downto 0);
	signal s_data2 :std_logic_vector(23 downto 0);
	signal s_guannum :std_logic_vector(2 downto 0);
	signal D6 :std_logic_vector(3 downto 0);
	signal D5 :std_logic_vector(3 downto 0);
	signal D4 :std_logic_vector(3 downto 0);
	signal D3 :std_logic_vector(3 downto 0);
	signal D2 :std_logic_vector(3 downto 0);
	signal D1 :std_logic_vector(3 downto 0);
	signal temp :std_logic_vector(3 downto 0);
	signal s_start :std_logic;
	signal s_start1 :std_logic;
		  
begin
----------------------------------------------------
	process(CLK)	
		variable Cnt: integer range 0 to 50000000;
		variable NumCnt: integer range 0 to 5;
		variable i: integer range 0 to 7;
		variable k: integer range 0 to 6;
	begin
		if CLK'event and CLK='1'then
				case i is
						when 0 =>   s_dianzhendata <= "110";
									s_guannum <= "000";
									if anxia='1' then
											if Num="1010" then
													i := i + 1;
													NumCnt := 5;
													temporary1(19 downto 0) <=  rData1(19 downto 0);    --存入随机数字
													temporary1(23 downto 20) <=  X"F";
											end if;
									end if;
									s_start <= '0';
									s_data2 <= X"FFFFFF";
									
						when 1 =>   s_dianzhendata <= conv_std_logic_vector(NumCnt,3);	
									s_guannum <= "001";
									if NumCnt=0 then
											temporary2 <= temporary1;
											temporary1 <= X"FFFFFF";
											Cnt := 0;
											i := i + 1;
									end if;
									if Cnt<50000000 then
											Cnt := Cnt + 1;
									else
											Cnt := 0;
											if NumCnt>0 then
												NumCnt := NumCnt - 1;                             --计算五秒倒计时
											end if;
									end if;
									
						when 2 =>   if anxia='1' then
											if Num<"1010" then
													                                               --存入输入的数字
													s_data2(3 downto 0) <= Num;
													s_data2(7 downto 4) <= s_data2(3 downto 0) ;
													s_data2(11 downto 8) <= s_data2(7 downto 4);
													s_data2(15 downto 12) <= s_data2(11 downto 8);
													s_data2(19 downto 16) <= s_data2(15 downto 12);
													
											elsif Num="1010" then

													if s_data2(19 downto 0)=temporary2(19 downto 0) then
																temporary1 <= rData1;
																i := i + 1;
																s_start1 <= '1';
																NumCnt := 5;
																s_guannum <= "010";
													else	
																temporary1(19 downto 0) <=  rData1(19 downto 0);
																temporary1(23 downto 20) <=  X"F";	
																i := 1;	
																NumCnt := 5;
																s_guannum <= "001";															
													end if;
													s_data2 <= X"FFFFFF";
											elsif Num="1011" then
													i := 0;	
											end if;
									end if;
									
						when 3 =>   s_dianzhendata <= conv_std_logic_vector(NumCnt,3);
									s_start1 <= '0';
									s_guannum <= "010";
									if NumCnt=0 then
											temporary2 <= temporary1;
											temporary1 <= X"FFFFFF";
											Cnt := 0;
											i := i + 1;
									end if;
									if Cnt<50000000 then                                             --计算一秒的时间
											Cnt := Cnt + 1;
									else
											Cnt := 0;
											if NumCnt>0 then
												NumCnt := NumCnt - 1;
											end if;
									end if;
									
						when 4 =>   if anxia='1' then
											if Num<"1010" then
													
													s_data2(3 downto 0) <= Num;
													s_data2(7 downto 4) <= s_data2(3 downto 0) ;
													s_data2(11 downto 8) <= s_data2(7 downto 4);
													s_data2(15 downto 12) <= s_data2(11 downto 8);
													s_data2(19 downto 16) <= s_data2(15 downto 12);
													s_data2(23 downto 20) <= s_data2(19 downto 16);
													
											elsif Num="1010" then
													temporary1 <=  rData1;
													if s_data2=temporary2 then                                   --如果数字输入正确
																i := i + 1;
																s_start1 <= '1';
																NumCnt := 3;
																s_guannum <= "011";
													else	
																temporary1(19 downto 0) <=  rData1(19 downto 0);
																temporary1(23 downto 20) <=  X"F";	
																i := 1;	
																NumCnt := 5;
																s_guannum <= "010";															
													end if;
													s_data2 <= X"FFFFFF";
											elsif Num="1011" then
													i := 0;	
											end if;
									end if;
									
						when 5 =>   s_dianzhendata <= conv_std_logic_vector(NumCnt,3);
									s_start1 <= '0';
									s_guannum <= "011";
									if NumCnt=0 then
											temporary2 <= temporary1;
											temporary1 <= X"FFFFFF";
											Cnt := 0;
											i := i + 1;
									end if;
									if Cnt<50000000 then
											Cnt := Cnt + 1;
									else
											Cnt := 0;
											if NumCnt>0 then
												NumCnt := NumCnt - 1;
											end if;
									end if;
									
						when 6 =>   if anxia='1' then
											if Num<"1010" then
													
													s_data2(3 downto 0) <= Num;
													s_data2(7 downto 4) <= s_data2(3 downto 0) ;
													s_data2(11 downto 8) <= s_data2(7 downto 4);
													s_data2(15 downto 12) <= s_data2(11 downto 8);
													s_data2(19 downto 16) <= s_data2(15 downto 12);
													s_data2(23 downto 20) <= s_data2(19 downto 16);
													
											elsif Num="1010" then
													temporary1 <=  rData1;
													if s_data2=temporary2 then
																i := i + 1;
																k := 0;
																NumCnt := 3;
																s_guannum <= "000";
													else
																temporary1(19 downto 0) <=  rData1(19 downto 0);
																temporary1(23 downto 20) <=  X"F";		
																i := 1;	
																NumCnt := 3;
																s_guannum <= "011";															
													end if;
													s_data2 <= X"FFFFFF";
											elsif Num="1011" then
													i := 0;	
											end if;
									end if;	
									
									
						when 7 =>	s_dianzhendata <= "111";	
									s_start <= '1';
									s_start1 <= '0';
									s_data2 <= X"FFFFFF";
									temporary1 <= X"FFFFFF";
									if anxia='1' then				
											if Num="1011" then
													i := 0;	
											end if;
									end if;	
					
									
							
				end case;
		
		end if;
	end	process;
	
------------------------------------------------
	dainzhen8x8 <= s_dianzhendata;
	guannum <= s_guannum;
	display1 <= temporary1;
	display2 <= s_data2;
	Start <= s_start;
	Start1 <= s_start1;
-------------------------------------------------
	
end control;