with Ada.Text_IO;

package body Maths is

   function Sum_Digits(N: Positive) return Positive is
      X: Positive := N;
      Sum: Integer := 0;
   begin
      while X >= 10 loop
         Sum := Sum + (X mod 10);
         X := X / 10;
      end loop;
      Sum := Sum + X;
      return Sum;
   end Sum_Digits;


   function Div_By_Nine(N: Positive) return Boolean is
   begin
      return ((N mod 9) = 0);
   end Div_By_Nine;


   procedure Div_By_Nine_Print(N: in Positive) is
   begin
      if Div_By_Nine(N) then
             Ada.Text_IO.Put_Line("OK");
      else
             Ada.Text_IO.Put_Line("NOT OK");
      end if;
	end Div_By_Nine_Print;

    procedure Perfect_Number(N: in Positive) is
          S: Natural;
          begin
          for I in 1..N loop
          S := 0;
          for J in 1..(I-1) loop
          if ((I mod J) = 0) then
          S := S + J;
          end if;
          end loop;
			 if S = I then
			 Ada.Text_IO.Put_Line(Integer'Image(I));
			 end if;

          end loop;
          end Perfect_Number;

	function Power_Rec(B: Natural; E: Natural) return Natural is
	begin
		if E = 0 then
			return 1;
		elsif B = 0 then
			return 0;
		else
			return B * Power_Rec(B, E - 1);
		end if;
	end Power_Rec;

end Maths;
