package body Bag_Package is

   procedure Insert_One(B: in out Bag; Elem: Element) is 
		Found: Boolean := false;
	begin
		for I in B.Elements'First..Index'Pred(B.Last) loop
			if B.Elements(I).Elem = Elem then
				B.Elements(I).Mul := B.Elements(I).Mul + 1;
				B.Size := B.Size + 1;
				Found := True;
			end if;
		end loop;
		if not Found and B.Last <= B.Elements'Last then
			B.Elements(B.Last) := New_Bag_Element(Elem);
			B.Size := B.Size + 1;
			B.Last := Index'Succ(B.Last);
		end if;
	end Insert_One;
			
	procedure Insert_Many(B: in out Bag; Elems: Element_Array) is
	begin
		for I in Elems'Range loop
			Insert_One(B, Elems(I));
		end loop;
	end Insert_Many;
 
	procedure Extract_One(B: in out Bag; Elem: Element) is
	begin
		for I in B.Elements'First..Index'Pred(B.Last) loop
			if B.Elements(I).Elem = Elem then
				if B.Elements(I).Mul > 1 then
					B.Elements(I).Mul := B.Elements(I).Mul - 1;
				else 
					-- Replaces the bag element with the last logical bag element
					-- since the current bag has zero multiplicity
					B.Elements(I) := B.Elements(Index'Pred(B.Last));
					B.Last := Index'Pred(B.Last);
				end if;
				B.Size := B.Size - 1;
			end if;
		end loop;
	end Extract_One;	
	
	procedure Extract_Many(B: in out Bag; Elems: Element_Array) is 
	begin 
		for I in Elems'Range loop
			Extract_One(B, Elems(I));
		end loop;
	end Extract_Many;
	
	function Is_Empty(B: Bag) return Boolean is
	begin
		return B.Size = 0;
	end Is_Empty;
	
	procedure Apply_All(B: Bag) is 
	begin
		for I in B.Elements'First..Index'Pred(B.Last) loop
			Fn(B.Elements(I).Elem, B.Elements(I).Mul);
		end loop;
	end Apply_All;
	
	function New_Bag_Element(Elem: Element) return Bag_Element is
		E : Bag_Element := (Elem, 1);
	begin
		return E;
	end New_Bag_Element;

end Bag_Package;
