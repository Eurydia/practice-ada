--
--  Instructions
--  Implement a generic package which will be responsible for sorting an array using the merge sort algorithm. The elements and the index of the array should be generic.
--
--  Implement a second package called StudentP. The package should have a type called Student which is private. The student has the following data members:
--  -Name
--  -Age
--  -Place of birth
--
--  Create getters for each data member and 1 function / procedure to set all of the data members of the student with parameters.
--
--  In a demo program create an array of the students and sort them by age using the generic merge sort package.
--  My work
with Ada.Text_IO; use Ada.Text_IO;
with Sorting;

procedure Main is
	type Index is new Integer;
	type Element is new Integer;
	type Int_Array is array (Index range <>) of Element;
	function Half_Of_Int(L: Index) return Index is
	begin
		return L / 2;
	end Half_Of_Int;
	function Sum_Of_Int(L,R: Index) return Index is
	begin
		return L + R;
	end Sum_Of_Int;
	function Diff_Of_Int(L,R: Index) return Index is
	begin
		return L - R;
	end Diff_Of_Int;
	function Less_Than_Ind(L, R: Index) return Boolean is
	begin
		return L < R;
	end Less_Than_Ind;
	function Less_Than_Elem(L, R: Element) return Boolean is
	begin
		return L < R;
	end Less_Than_Elem;
	package Integer_Sorting is new Sorting(Element, Index, Int_Array, Half_Of_Int, Sum_Of_Int, Diff_Of_Int, Less_Than_Ind, Less_Than_Elem);
	use Integer_Sorting;

	Arr : Int_Array(0..5) := (0,4,1,3,2,5);

begin
   --  Insert code here.
   Integer_Sorting.Merge_Sort(Arr);
	for I in Arr'Range loop
		Put(Element'Image(Arr(I)) & ",");
	end loop;
end Main;
