with Ada.Text_IO, ArrayIntros;
procedure Main is
	My_Arr: ArrayIntros.IntegerArray := (1,2,3,4,56);
begin
	Ada.Text_IO.Put_Line(Integer'Image(arrayintros.Sum_Array_Rec(My_arr)));

end Main;
