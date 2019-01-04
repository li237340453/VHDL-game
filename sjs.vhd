library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity sjs is
    Port (
			CLK  			  :in std_logic;                    -- ±÷”–≈∫≈
			dataout           :out std_logic_vector(23 downto 0);
			mode              :in std_logic
		 );		    
end sjs;

architecture sjs of sjs is

	signal s_dataout :std_logic_vector(23 downto 0);
		  
begin
----------------------------------------------------
	process(CLK)	
		variable shuzi1: integer range 0 to 9;
		variable shuzi2: integer range 0 to 9;
		variable shuzi3: integer range 0 to 9;
		variable shuzi4: integer range 0 to 9;
		variable shuzi5: integer range 0 to 9;
		variable shuzi6: integer range 0 to 9;
	begin
		if CLK'event and CLK='1'then
		
		if(mode='0')then		
				if shuzi1<9 then 
						shuzi1:=shuzi1+1; 
				else 
						shuzi1:=0; 
						if shuzi2<9 then 
							shuzi2:=shuzi2+1;	
						else
							shuzi2:=0;
							if shuzi3<9 then
								shuzi3:=shuzi3+1;		
							else
								shuzi3:=0;
								if shuzi4<9 then
									shuzi4:=shuzi4+1;	
								else
									shuzi4:=0;
									if shuzi5<9 then
										shuzi5:=shuzi5+1;
									else
										shuzi5:=0;
										if shuzi6<9 then
											shuzi6:=shuzi6+1;
										else
											shuzi6:=0;
										end if;
									end if;
								end if;
							end if;
						end if;
				end if;
		else
				if shuzi1<9 then 
						shuzi1:=shuzi1+1; 
				else 
						if shuzi2<8 then
		     				shuzi1:=shuzi2+1;   
							shuzi2:=shuzi2+1;	
						else
							shuzi2:=shuzi3;
							shuzi1:=shuzi3;
							if shuzi3<7 then
						    	shuzi2:=shuzi3+1;
						    	shuzi1:=shuzi3+1;
								shuzi3:=shuzi3+1;		
							else
								shuzi3:=shuzi4;
					     		shuzi2:=shuzi4;
					     		shuzi1:=shuzi4;
								if shuzi4<6 then
									shuzi4:=shuzi4+1;
						    		shuzi3:=shuzi4+1;
					         		shuzi2:=shuzi4+1;
					         		shuzi1:=shuzi4+1;
								else
									shuzi4:=shuzi5;
							    	shuzi3:=shuzi5;
					     	    	shuzi2:=shuzi5;
					     	    	shuzi1:=shuzi5;
									if shuzi5<5 then
						    			shuzi4:=shuzi5+1;
						    	    	shuzi3:=shuzi5+1;
					      	    	    shuzi2:=shuzi5+1;
					         	    	shuzi1:=shuzi5+1;
										shuzi5:=shuzi5+1;
									else
										shuzi5:=shuzi6;
							     		shuzi4:=shuzi6;
							         	shuzi3:=shuzi6;
					     	        	shuzi2:=shuzi6;
					     	        	shuzi1:=shuzi6;
										if shuzi6<4 then
			    							shuzi5:=shuzi6+1;
			    				     		shuzi4:=shuzi6+1;
			    				         	shuzi3:=shuzi6+1;
				    	     	        	shuzi2:=shuzi6+1;
				    	     	        	shuzi1:=shuzi6+1;
											shuzi6:=shuzi6+1;
										else
											shuzi6:=0;
											shuzi5:=0;
											shuzi4:=0;
											shuzi3:=0;
											shuzi2:=0;
											shuzi1:=0;
										end if;
									end if;
								end if;
							end if;
						end if;
				end if;
		end if;
								
				
				s_dataout(23 downto 20) <= conv_std_logic_vector(shuzi6 ,4);
				s_dataout(19 downto 16) <= conv_std_logic_vector(shuzi5 ,4);
				s_dataout(15 downto 12) <= conv_std_logic_vector(shuzi4 ,4); 
				s_dataout(11 downto 8) <= conv_std_logic_vector(shuzi3 ,4);
				s_dataout(7 downto 4) <= conv_std_logic_vector(shuzi2 ,4);
				s_dataout(3 downto 0) <= conv_std_logic_vector(shuzi1 ,4);
		end if;
	end	process;
	
------------------------------------------------
	dataout <= s_dataout;
-------------------------------------------------
	
end sjs;