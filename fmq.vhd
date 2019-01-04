library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity fmq is
    Port (
			CLK_50Mhz  			:in std_logic;                    --时钟信号
			Go					:in std_logic; 
			Go1					:in std_logic; 
			clkout              :out std_logic
		 );		    
end fmq;

architecture fmq of fmq is

	signal reg_clkout :std_logic;	
	signal LastGo1 :std_logic;
	signal Go_1s :std_logic;
	
		signal rSpeaker :std_logic;	
		signal SpeakerEn :std_logic;
		signal SpeedFlag :std_logic;
		signal L_1: integer range 0 to 100000;
		signal L_2: integer range 0 to 100000;
		signal L_3: integer range 0 to 100000;
		signal L_4: integer range 0 to 100000;
		signal L_5: integer range 0 to 100000;
		signal L_6: integer range 0 to 100000;
		signal L_7: integer range 0 to 100000;
		signal M_1: integer range 0 to 100000;
		signal M_2: integer range 0 to 100000;
		signal M_3: integer range 0 to 100000;
		signal M_4: integer range 0 to 100000;
		signal M_5: integer range 0 to 100000;
		signal M_6: integer range 0 to 100000;
		signal M_7: integer range 0 to 100000;
		signal H_1: integer range 0 to 100000;
		signal H_2: integer range 0 to 100000;
		signal H_3: integer range 0 to 100000;
		signal H_4: integer range 0 to 100000;
		signal H_5: integer range 0 to 100000;
		signal H_6: integer range 0 to 100000;
		signal H_7: integer range 0 to 100000;
		signal Cntend: integer range 0 to 100000;	
		

		  
begin
----------------------------------------------------
	process(CLK_50Mhz)	
		variable cnt: integer range 0 to 50000;
		variable cnt1: integer range 0 to 50000000;
		variable CntMusic: integer range 0 to 100000;
		variable i: integer range 0 to 12000000;
		variable state: integer range 0 to 100;
		variable SongFlag: integer range 0 to 2;
		variable JiePai: integer range 0 to 12000000;	
	begin
		if CLK_50Mhz'event and CLK_50Mhz='1'then
				L_1 <= 76443;
				L_2 <= 68103;
				L_3 <= 60674;
				L_4 <= 57306;
				L_5 <= 51020;
				L_6 <= 45454;
				L_7 <= 40485;
				M_1 <= 38222;
				M_2 <= 34052;
				M_3 <= 30337;
				M_4 <= 27672;--
				M_5 <= 25510;
				M_6 <= 22727;
				M_7 <= 20422;--
				H_1 <= 19111;
				H_2 <= 15168;
				H_3 <= 14316;
				H_4 <= 14101;--
		        H_5 <= 12010;--
		        H_6 <= 10204;--
		        H_7 <= 8655;--
		
		
				if Go='1' then                                                       --播放音乐状态
							Go_1s <= '0';
						
							JiePai := 12000000;                                      --一个频率的总时间长度
								
							CntMusic := CntMusic + 1;		
							if CntMusic>=Cntend then                                 --该频率下高低电平跳变
									CntMusic := 0;
									rSpeaker <= not rSpeaker;
							end if;
							
							if i<JiePai then                                       
									i := i + 1;
							else                                                     --时间长度到了选择频率
									i := 0;
									if state>=56 then
										state := 0;
									else
										state := state + 1;
									end if;
									case state is
									---------------------------------------
									when  0 =>  Cntend<=L_5;
									when  1 =>  Cntend<=M_3;
									when  2 =>	Cntend<=M_3;
									when  3 =>	Cntend<=M_3;
									when  4 =>	Cntend<=M_5;
									when  5 =>	Cntend<=M_4;
									when  6 =>	Cntend<=L_5;
									when  7 =>	Cntend<=M_2;
									when  8 =>	Cntend<=L_5;
									when  9 =>	Cntend<=M_2;
									when 10 =>	Cntend<=M_2;
									when 11 =>	Cntend<=M_2;
									when 12 =>	Cntend<=M_2;
									when 13 =>	Cntend<=M_3;
									when 14 =>	Cntend<=M_4;
									when 15 =>	Cntend<=M_3;
									when 16 =>	Cntend<=M_1;
									when 17 =>	Cntend<=M_6;
									when 18 =>	Cntend<=M_6;
									when 19 =>	Cntend<=M_6;
									when 20 =>	Cntend<=M_6;
									when 21 =>	Cntend<=M_7;
									when 22 =>	Cntend<=H_1;
									when 23 =>	Cntend<=M_5;
									when 24 =>	Cntend<=M_4;
									when 25 =>	Cntend<=M_3;
									when 26 =>	Cntend<=M_4;
									when 27 =>	Cntend<=M_4;
									when 28 =>	Cntend<=M_4;
									when 29 =>	Cntend<=M_4;
									when 30 =>	Cntend<=M_5;
									when 31 =>	Cntend<=M_6;
									when 32 =>	Cntend<=M_5;
									when 33 =>	Cntend<=M_2;
									when 34 =>	Cntend<=M_2;
									when 35 =>	Cntend<=L_5;
									when 36 =>	Cntend<=M_3;
									when 37 =>	Cntend<=M_3;
									when 38 =>	Cntend<=M_3;
									when 39 =>	Cntend<=M_4;
									when 40 =>	Cntend<=M_5;
									when 41 =>	Cntend<=M_2;
									when 42 =>	Cntend<=L_5;
									when 43 =>	Cntend<=L_2;
									when 44 =>	Cntend<=L_2;
									when 45 =>	Cntend<=L_2;
									when 46 =>	Cntend<=L_2;
									when 47 =>	Cntend<=M_3;
									when 48 =>	Cntend<=M_4;
									when 49 =>	Cntend<=M_3;
									when 50 =>	Cntend<=M_1;
									when 51 =>	Cntend<=M_6;
									when 52 =>	Cntend<=M_6;
									when 53 =>	Cntend<=M_6;
									when 54 =>	Cntend<=M_6;
									when 55 =>	Cntend<=M_7;
--									when 56 =>	Cntend<=H_1;
--									when 57 =>	Cntend<=M_5;
--									when 58 =>	Cntend<=M_4;
--									when 59 =>	Cntend<=M_3;
--									when 60 =>	Cntend<=L_6;
--									when 61 =>	Cntend<=M_2;
--									when 62 =>	Cntend<=M_2;
--									when 63 =>	Cntend<=M_2;
--									when 64 =>	Cntend<=M_4;
--									when 65 =>	Cntend<=M_5;
									when others =>	Cntend<=L_5;
									---------------------------------------
									end case;
							end if;		
						
				else                                                                         --发声提示过关，占空比1：1000						
				        LastGo1 <= Go1;
						if Go1='1' and LastGo1='0' then
								Go_1s <= '1';
						end if;
						if Go_1s='1' then
								if cnt1<50000000 then
										cnt1 := cnt1 + 1;
										if cnt<50000 then
												cnt := cnt + 1;	
										else		
												cnt := 0;
												rSpeaker <= not rSpeaker;
										end if;
								else
										cnt1 := 0;
										Go_1s <= '0';
								end if;
								
						else
								rSpeaker <= '0';
								CntMusic := 0;
								i := 0;
								cnt := 0;	
								cnt1 := 0;							
						end if;
				end if;
			
		end if;
	end	process;
	
------------------------------------------------
	clkout <= rSpeaker;
-------------------------------------------------
	
end fmq;