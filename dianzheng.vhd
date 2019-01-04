library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity dianzheng is
    Port (
			CLK  		   :in std_logic;                    --时钟信号
			number         :in std_logic_vector(2 downto 0); 
			rowred   		   :out std_logic_vector(7 downto 0);	
			rowgreen   		   :out std_logic_vector(7 downto 0);	
			col            :out std_logic_vector(7 downto 0)
		 );		    
end dianzheng;

architecture dianzheng of dianzheng is

	signal s_row :std_logic_vector(7 downto 0);
	signal s_col :std_logic_vector(7 downto 0);
--	signal DisFlag :std_logic_vector(2 downto 0);
	signal i :std_logic_vector(2 downto 0);
	
	signal s_data00 :std_logic_vector(7 downto 0);
	signal s_data01 :std_logic_vector(7 downto 0);
	signal s_data02 :std_logic_vector(7 downto 0);
	signal s_data03 :std_logic_vector(7 downto 0);
	signal s_data04 :std_logic_vector(7 downto 0);
	signal s_data05 :std_logic_vector(7 downto 0);
	signal s_data06 :std_logic_vector(7 downto 0);
	signal s_data07 :std_logic_vector(7 downto 0);
	
	signal s_data10 :std_logic_vector(7 downto 0);
	signal s_data11 :std_logic_vector(7 downto 0);
	signal s_data12 :std_logic_vector(7 downto 0);
	signal s_data13 :std_logic_vector(7 downto 0);
	signal s_data14 :std_logic_vector(7 downto 0);
	signal s_data15 :std_logic_vector(7 downto 0);
	signal s_data16 :std_logic_vector(7 downto 0);
	signal s_data17 :std_logic_vector(7 downto 0);

	signal s_data20 :std_logic_vector(7 downto 0);
	signal s_data21 :std_logic_vector(7 downto 0);
	signal s_data22 :std_logic_vector(7 downto 0);
	signal s_data23 :std_logic_vector(7 downto 0);
	signal s_data24 :std_logic_vector(7 downto 0);
	signal s_data25 :std_logic_vector(7 downto 0);
	signal s_data26 :std_logic_vector(7 downto 0);
	signal s_data27 :std_logic_vector(7 downto 0);
	
	signal s_data30 :std_logic_vector(7 downto 0);
	signal s_data31 :std_logic_vector(7 downto 0);
	signal s_data32 :std_logic_vector(7 downto 0);
	signal s_data33 :std_logic_vector(7 downto 0);
	signal s_data34 :std_logic_vector(7 downto 0);
	signal s_data35 :std_logic_vector(7 downto 0);
	signal s_data36 :std_logic_vector(7 downto 0);
	signal s_data37 :std_logic_vector(7 downto 0);
	
	signal s_data40 :std_logic_vector(7 downto 0);
	signal s_data41 :std_logic_vector(7 downto 0);
	signal s_data42 :std_logic_vector(7 downto 0);
	signal s_data43 :std_logic_vector(7 downto 0);
	signal s_data44 :std_logic_vector(7 downto 0);
	signal s_data45 :std_logic_vector(7 downto 0);
	signal s_data46 :std_logic_vector(7 downto 0);
	signal s_data47 :std_logic_vector(7 downto 0);
	
	signal s_data50 :std_logic_vector(7 downto 0);
	signal s_data51 :std_logic_vector(7 downto 0);
	signal s_data52 :std_logic_vector(7 downto 0);
	signal s_data53 :std_logic_vector(7 downto 0);
	signal s_data54 :std_logic_vector(7 downto 0);
	signal s_data55 :std_logic_vector(7 downto 0);
	signal s_data56 :std_logic_vector(7 downto 0);
	signal s_data57 :std_logic_vector(7 downto 0);
	
	signal s_data60 :std_logic_vector(7 downto 0);
	signal s_data61 :std_logic_vector(7 downto 0);
	signal s_data62 :std_logic_vector(7 downto 0);
	signal s_data63 :std_logic_vector(7 downto 0);
	signal s_data64 :std_logic_vector(7 downto 0);
	signal s_data65 :std_logic_vector(7 downto 0);
	signal s_data66 :std_logic_vector(7 downto 0);
	signal s_data67 :std_logic_vector(7 downto 0);
	
	signal s_data70 :std_logic_vector(7 downto 0);
	signal s_data71 :std_logic_vector(7 downto 0);
	signal s_data72 :std_logic_vector(7 downto 0);
	signal s_data73 :std_logic_vector(7 downto 0);
	signal s_data74 :std_logic_vector(7 downto 0);
	signal s_data75 :std_logic_vector(7 downto 0);
	signal s_data76 :std_logic_vector(7 downto 0);
	signal s_data77 :std_logic_vector(7 downto 0);
	
	signal col_1 :std_logic_vector(7 downto 0);
	signal col_2 :std_logic_vector(7 downto 0);
	signal col_3 :std_logic_vector(7 downto 0);
	signal col_4 :std_logic_vector(7 downto 0);
	signal col_5 :std_logic_vector(7 downto 0);
	signal col_6 :std_logic_vector(7 downto 0);
	signal col_7 :std_logic_vector(7 downto 0);
	signal col_8 :std_logic_vector(7 downto 0);
		  
begin
----------------------------------------------------
	process(CLK)	
		variable Cnt_i: integer range 0 to 50000000;
--        variable Cnt_i: integer range 0 to 5;
	begin
		if CLK'event and CLK='1'then
			------------0--------------
				s_data00 <= X"00";
				s_data01 <= X"3C";
				s_data02 <= X"24";
				s_data03 <= X"24";
				s_data04 <= X"24";
				s_data05 <= X"24";
				s_data06 <= X"3C";
				s_data07 <= X"00";
			---------------------------
			------------1--------------
--				s_data10 <= X"00";
--				s_data11 <= X"10";
--				s_data12 <= X"10";
--				s_data13 <= X"10";
--				s_data14 <= X"10";
--				s_data15 <= X"10";
--				s_data16 <= X"10";
--				s_data17 <= X"00";
				
				s_data10 <= X"00";
				s_data11 <= X"00";
				s_data12 <= X"00";
				s_data13 <= X"00";
				s_data14 <= X"ff";
				s_data15 <= X"00";
				s_data16 <= X"00";
				s_data17 <= X"00";
			---------------------------
			------------2--------------
--				s_data20 <= X"00";
--				s_data21 <= X"3C";
--				s_data22 <= X"04";
--				s_data23 <= X"04";
--				s_data24 <= X"3C";
--				s_data25 <= X"20";
--				s_data26 <= X"20";
--				s_data27 <= X"3C";
				
				s_data20 <= X"00";
				s_data21 <= X"00";
				s_data22 <= X"3c";
				s_data23 <= X"00";
				s_data24 <= X"00";
				s_data25 <= X"ff";
				s_data26 <= X"00";
				s_data27 <= X"00";
			---------------------------
			------------3--------------
--				s_data30 <= X"00";
--				s_data31 <= X"3C";
--				s_data32 <= X"04";
--				s_data33 <= X"04";
--				s_data34 <= X"3C";
--				s_data35 <= X"04";
--				s_data36 <= X"04";
--				s_data37 <= X"3C";
				
				s_data30 <= X"00";
				s_data31 <= X"fe";
				s_data32 <= X"00";
				s_data33 <= X"3c";
				s_data34 <= X"00";
				s_data35 <= X"ff";
				s_data36 <= X"00";
				s_data37 <= X"00";
			---------------------------
			------------4--------------
--				s_data40 <= X"00";
--				s_data41 <= X"24";
--				s_data42 <= X"24";
--				s_data43 <= X"24";
--				s_data44 <= X"3C";
--				s_data45 <= X"04";
--				s_data46 <= X"04";
--				s_data47 <= X"04";
				
				s_data40 <= X"ff";
				s_data41 <= X"99";
				s_data42 <= X"99";
				s_data43 <= X"99";
				s_data44 <= X"ff";
				s_data45 <= X"81";
				s_data46 <= X"81";
				s_data47 <= X"ff";
			---------------------------
			------------5--------------
--				s_data50 <= X"00";
--				s_data51 <= X"3C";
--				s_data52 <= X"20";
--				s_data53 <= X"20";
--				s_data54 <= X"3C";
--				s_data55 <= X"04";
--				s_data56 <= X"04";
--				s_data57 <= X"3C";
				
				s_data50 <= X"e7";
				s_data51 <= X"01";
				s_data52 <= X"01";
				s_data53 <= X"c7";
				s_data54 <= X"41";
				s_data55 <= X"41";
				s_data56 <= X"41";
				s_data57 <= X"ff";
			---------------------------
			------------6--------------
--				s_data60 <= X"00";
--				s_data61 <= X"7E";
--				s_data62 <= X"42";
--				s_data63 <= X"5A";
--				s_data64 <= X"5A";
--				s_data65 <= X"42";
--				s_data66 <= X"7E";
--				s_data67 <= X"00";
			---------------------------
			------------7--------------
--				s_data70 <= X"00";
--				s_data71 <= X"C1";
--				s_data72 <= X"63";
--				s_data73 <= X"22";
--				s_data74 <= X"36";
--				s_data75 <= X"14";
--				s_data76 <= X"1C";
--				s_data77 <= X"08";
			--------------------------- 
			----------Hi------------
				s_data60 <= X"00";
				s_data61 <= X"09";
				s_data62 <= X"09";
				s_data63 <= X"49";
				s_data64 <= X"0f";
				s_data65 <= X"49";
				s_data66 <= X"49";
				s_data67 <= X"49";
			--------------------------- 
			----------SMILE------------
				col_8 <= "00000000";
				col_7 <= "01100110";
				col_6 <= "01100110";
				col_5 <= "00000000";
				col_4 <= "00000000";
				col_3 <= "10000001";
				col_2 <= "01000010";
				col_1 <= "00111100";
			--------------------------- 
			
			
				Cnt_i := Cnt_i + 1;
				if Cnt_i=50000 then                                      --分频部分
					Cnt_i := 0;
					i <= i + '1';
				end	if;
							
				case i is                                                --行扫描
					when "000" => s_col<="11111110";
					when "001" => s_col<="11111101";
					when "010" => s_col<="11111011";
					when "011" => s_col<="11110111";
					when "100" => s_col<="11101111";
					when "101" => s_col<="11011111";
					when "110" => s_col<="10111111";
					when "111" => s_col<="01111111";
				end case;
				
				
				case number is                                           --列信息数字
						when "000" =>
								case i is
									when "000" => s_row<=s_data00;
									when "001" => s_row<=s_data01;
									when "010" => s_row<=s_data02;
									when "011" => s_row<=s_data03;
									when "100" => s_row<=s_data04;
									when "101" => s_row<=s_data05;
									when "110" => s_row<=s_data06;
									when "111" => s_row<=s_data07;
								end case;
								
						when "001" =>
								case i is
									when "000" => s_row<=s_data10;
									when "001" => s_row<=s_data11;
									when "010" => s_row<=s_data12;
									when "011" => s_row<=s_data13;
									when "100" => s_row<=s_data14;
									when "101" => s_row<=s_data15;
									when "110" => s_row<=s_data16;
									when "111" => s_row<=s_data17;
								end case;
								
						when "010" =>
								case i is
									when "000" => s_row<=s_data20;
									when "001" => s_row<=s_data21;
									when "010" => s_row<=s_data22;
									when "011" => s_row<=s_data23;
									when "100" => s_row<=s_data24;
									when "101" => s_row<=s_data25;
									when "110" => s_row<=s_data26;
									when "111" => s_row<=s_data27;
								end case;
								
						when "011" =>
								case i is
									when "000" => s_row<=s_data30;
									when "001" => s_row<=s_data31;
									when "010" => s_row<=s_data32;
									when "011" => s_row<=s_data33;
									when "100" => s_row<=s_data34;
									when "101" => s_row<=s_data35;
									when "110" => s_row<=s_data36;
									when "111" => s_row<=s_data37;
								end case;
								
						when "100" =>
								case i is
									when "000" => s_row<=s_data40;
									when "001" => s_row<=s_data41;
									when "010" => s_row<=s_data42;
									when "011" => s_row<=s_data43;
									when "100" => s_row<=s_data44;
									when "101" => s_row<=s_data45;
									when "110" => s_row<=s_data46;
									when "111" => s_row<=s_data47;
								end case;
								
						when "101" =>
								case i is
									when "000" => s_row<=s_data50;
									when "001" => s_row<=s_data51;
									when "010" => s_row<=s_data52;
									when "011" => s_row<=s_data53;
									when "100" => s_row<=s_data54;
									when "101" => s_row<=s_data55;
									when "110" => s_row<=s_data56;
									when "111" => s_row<=s_data57;
								end case;
								
						when "110" =>
								case i is
									when "000" => s_row<=s_data60;
									when "001" => s_row<=s_data61;
									when "010" => s_row<=s_data62;
									when "011" => s_row<=s_data63;
									when "100" => s_row<=s_data64;
									when "101" => s_row<=s_data65;
									when "110" => s_row<=s_data66;
									when "111" => s_row<=s_data67;
								end case;
								
						when "111" =>
								case i is
									when "000" => s_row<=col_8;
									when "001" => s_row<=col_7;
									when "010" => s_row<=col_6;
									when "011" => s_row<=col_5;
									when "100" => s_row<=col_4;
									when "101" => s_row<=col_3;
									when "110" => s_row<=col_2;
									when "111" => s_row<=col_1;
								end case;
				
				end case;	
				
			
				
			
		end if;
	end	process;
	
------------------------------------------------
	rowgreen <= s_row;
	col <= s_col;
	rowred <= X"00";
-------------------------------------------------
	
end dianzheng;