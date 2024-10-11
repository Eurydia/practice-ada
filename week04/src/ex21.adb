with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Set_Q;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Set_Q;

procedure Ex21 is
	R1: Rational := 4/8;
	R2: Rational := 5/7;
	R3: Rational;
begin

		R3 := R1 / R2;
		Put_Line(Integer'Image(Numberator(R3)));
		Put_Line(Integer'Image(Denominator(R3)));
end Ex21;
