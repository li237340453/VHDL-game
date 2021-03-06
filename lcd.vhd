Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Entity lcd is
Port(
       CLK  		 :in std_logic;
       step          :in std_logic_vector(2 downto 0);
       jqs         :in std_logic_vector(23 downto 0);
       yhs         :in std_logic_vector(23 downto 0);
       RW   		 :out std_logic;
       EN   		 :out std_logic;
       RS   		 :out std_logic;
       data 		 :out std_logic_vector(7 downto 0)
      );
end;

Architecture lcd of lcd is

	type shuzi is array(0 to 15) of std_logic_vector(7 downto 0);  --lcd 0-9
	constant smg :shuzi :=(
							("00110000"),("00110001"),("00110010"),("00110011"),("00110100"),
							("00110101"),("00110110"),("00110111"),("00111000"),("00111001"),
							("01000001"),("01000010"),("01000011"),("01000100"),("01000101"),
							("10100000")
						 );

signal qfp:integer range 0 to 50000;
--signal qfp:integer range 0 to 5;
signal cp:std_logic;
signal Flag:integer range 0 to 100;

--signal Alarm_T:integer range 0 to 100;
--signal Alarm_H:integer range 0 to 100;

begin
  process(CLK)
     begin
				if CLK'event and CLK='1' then                     --分频器
                 qfp<=qfp+1;
                 if qfp=0 then
                     cp<=not cp;
                 end if;  
				end if;
     end process;
     
     RW<='0';
     EN<=cp;
     
     process(cp)
        variable cnt:integer range 0 to 37;
        begin
          if CR='0' then
             cnt:=0;
             data<="00000001";
          elsif cp'event and cp='1' then
					cnt:=cnt+1;
					if cnt>37 then 
							if Flag=55 then
									cnt := 4;
							else
									cnt := 0;
									Flag <= 55;
							end if;		
					end if;
          end if;
          case cnt is
          -------Init lcd-----------
          when 0 =>RS<='0';data<="00111000";  --0x38,
          when 1 =>RS<='0';data<="00001100";  --0x0C
          when 2 =>RS<='0';data<="00000001";  --0x01
          when 3 =>RS<='0';data<="00000110";  --0x60
          ----------------------------------
          when 4 =>RS<='0';data<="10000000";  --display,0x00+0x80,1h1w
          -------data display-------------
          when 5=>RS<='1';data<=smg(conv_integer(jqs(23 downto 20)));
		  when 6=>RS<='1';data<=smg(conv_integer(jqs(19 downto 16)));
		  when 7=>RS<='1';data<=smg(conv_integer(jqs(15 downto 12)));
	      when 8=>RS<='1';data<=smg(conv_integer(jqs(11 downto 8)));
          when 9=>RS<='1';data<=smg(conv_integer(jqs(7 downto 4)));
          when 10=>RS<='1';data<=smg(conv_integer(jqs(3 downto 0)));
          when 11=>RS<='1';data<="10100000";--空格
          when 12=>RS<='1';data<="10100000";--空格
          when 13=>RS<='1';data<="10100000";--空格
          when 14=>RS<='1';data<="10100000";--空格
          when 15=>RS<='1';data<="10100000";--空格
          when 16=>RS<='1';data<="10100000";--空格
          when 17=>RS<='1';data<="10100000";--空格
          when 18=>RS<='1';data<="10100000";--空格
          when 19=>RS<='1';data<="10100000";--空格
          when 20=>RS<='1';data<=smg(conv_integer(step));
     ---------------------------
         when 21=>RS<='0';data<="11000000";--设定显示的位置在10H+80H，
       ----------------------------
         when 22=>RS<='1';data<=smg(conv_integer(yhs(23 downto 20)));
         when 23=>RS<='1';data<=smg(conv_integer(yhs(19 downto 16)));
         when 24=>RS<='1';data<=smg(conv_integer(yhs(15 downto 12)));
         when 25=>RS<='1';data<=smg(conv_integer(yhs(11 downto 8)));
         when 26=>RS<='1';data<=smg(conv_integer(yhs(7 downto 4)));
         when 27=>RS<='1';data<=smg(conv_integer(yhs(3 downto 0)));
         when 28=>RS<='1';data<="10100000";--空格 
         when 29=>RS<='1';data<="10100000";--空格 
         when 30=>RS<='1';data<="10100000";--空格 
         when 31=>RS<='1';data<="10100000";--空格 
         when 32=>RS<='1';data<="10100000";--空格 
         when 33=>RS<='1';data<="10100000";--空格 
         when 34=>RS<='1';data<="10100000";--空格 
         when 35=>RS<='1';data<="10100000";--空格 
         when 36=>RS<='1';data<="10100000";--空格 
         when 37=>RS<='1';data<="10100000";--空格 
		 end case;
      end process;
     end;