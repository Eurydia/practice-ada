package body Sorting is

	procedure Merge_Sort(Arr: in out Element_Array) is
		Left: Index := Arr'First; 
		Right: Index := Arr'Last;
	begin
		Do_Merge_Sort(Arr, Left, Right);
	end Merge_Sort;
	

	procedure Do_Merge(Arr: in out Element_Array; Left, Mid, Right: Index) is
		N1: Index := Index'Succ(Mid - Left);
		N2: Index := Right - Mid;
		L: Element_Array(Index'First..N1);
		R: Element_Array(Index'First..N2);
	begin
		for I in L'Range loop
			L(I) := Arr(Left + I);
		end loop;
		for J in R'Range loop
			R(J) := Arr(Index'Succ(Mid) + J);
		end loop;
		declare
			I: Index := Index'First;
			J: Index := Index'First;
			K: Index := Left;
		begin
			while (I < N1 and J < N2) loop
				if L(I) < R(J) or L(I) = R(J) then
			       Arr(K) := L(I);
					 I := Index'Succ(I);
				else
				    Arr(K) := R(J);
			        J := Index'Succ(J);
		  end if;
		  K := Index'Succ(K);
		  end loop;
		  while (I < N1) loop
		  Arr(K) := L(I);
		  I := Index'Succ(I);
		  K := Index'Succ(K);
		  end loop;
		  while (J < N2) loop
		  Arr(K) := R(J);
		  J := Index'Succ(J);
		  K := Index'Succ(K);
		  end loop;
		  
		  end;
		  
	end Do_Merge;
	procedure Do_Merge_Sort(Arr: in out Element_Array; Left, Right: Index) is
		Mid: Index := Left + Half_Of(Right - Left);
	
	begin
		if Left < Right then
			Do_Merge_Sort(Arr, Left, Mid);
			Do_Merge_Sort(Arr, Index'Succ(Mid), Right);
			Do_Merge(Arr, Left, Mid, Right);	
		end if;
	end Do_Merge_Sort;
	

end Sorting;
