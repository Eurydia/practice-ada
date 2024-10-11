with Trigonometry, Ada.Integer_Text_IO, Ada.Text_IO, Ada.Numerics.Elementary_Functions;

procedure Main is
	X: Integer;
	Rad: Float;
	Deg: Float;
begin
	Ada.Integer_Text_IO.Get(X);

	Rad := Ada.Numerics.Elementary_Functions.Cos(Float(X));
	Ada.Text_IO.put("As Radian: ");
	Trigonometry.TrigPutFloat(Rad);

	Deg := Trigonometry.TrigCosine(X);
	Ada.Text_IO.put("As Degree: ");
	Trigonometry.TrigPutFloat(Deg);
end Main;
