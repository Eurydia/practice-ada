with Ada.Numerics.Elementary_Functions, Ada.Text_IO;

package body Trigonometry is

   function TrigCosine(X: in Integer) return Float is
		Cos_X_Rad: Float;
		Cos_X_Deg: Float;
	begin
		Cos_X_Rad := Ada.Numerics.Elementary_Functions.Cos(Float(X));
		Cos_X_Deg := Cos_X_Rad * 180.0;
		return Cos_X_Deg;
	end TrigCosine;
	
	procedure TrigPutFloat(X: in Float) is
	begin
		Ada.Text_IO.Put_Line(Float'Image(X));
	end TrigPutFloat;

end Trigonometry;
