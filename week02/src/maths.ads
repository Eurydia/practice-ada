package Maths is

   function Sum_Digits(N: Positive) return Positive;
   function Div_By_Nine(N: Positive) return Boolean;
   
   procedure Div_By_Nine_Print(N: in Positive);
   procedure Perfect_Number(N: in Positive);
	function Power_Rec (B: Natural; E: Natural) return Natural;
end Maths;
