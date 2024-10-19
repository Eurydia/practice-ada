
generic
	type Element is private;
	type Index is (<>);
	type Element_Array is array (Index range <>) of Element;
	with function Half_Of(L: Index) return Index;
	with function "+"(L, R: Index) return Index;
	with function "-"(L, R: Index) return Index;
	with function "<"(L, R: Index) return Boolean;
	with function "<"(L, R: Element) return Boolean;
package Sorting is
	procedure Merge_Sort(Arr: in out Element_Array);
	
private
	procedure Do_Merge(Arr: in out Element_Array; Left, Mid, Right: Index);
	procedure Do_Merge_Sort(Arr: in out Element_Array; Left, Right: Index);
end Sorting;
