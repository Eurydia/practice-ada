with Maths;
with Ada.Text_IO;
procedure Main is
   X: Positive;
   X_Div_By_Nine: Boolean;
begin
   X := Maths.Sum_Digits(999);
   Ada.Text_IO.Put_Line(Integer'Image(X));


   X_Div_By_Nine := Maths.Div_By_Nine(X);
   Ada.Text_IO.Put_Line(Boolean'Image(X_Div_By_Nine));


	Maths.Perfect_Number(10000);

	Ada.Text_IO.Put_Line(Integer'Image(
	Maths.Power_Rec(9,2)));
end Main;
