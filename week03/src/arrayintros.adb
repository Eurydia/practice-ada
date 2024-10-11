package body ArrayIntros is
 --  function Sum_Array_Rec_Accum(Arr:IntegerArray; Index: Natural; Total:Integer) return Integer is
 --  begin
 --  	if Index = Arr'Last then
 --  		return Total + Arr(Index);
 --  	else
 --  		return Sum_Array_Rec_Accum(Arr, Index + 1, Total + Arr(Index));
 --  	end if;
 --  end Sum_Array_Rec_Accum;

   function Sum_Array_Rec(Arr: IntegerArray) return Integer is
		Total: Integer := 0;
	begin
		for I in Arr'Range loop
			Total := Total + Arr(I);
		end loop;
		return Total;
	end Sum_Array_Rec;

end ArrayIntros;
