package ArrayIntros is
	type Index is new Natural;
	type IntegerArray is array (Index range <>) of Integer;

   function Sum_Array_Rec(Arr: IntegerArray) return Integer;

end ArrayIntros;
