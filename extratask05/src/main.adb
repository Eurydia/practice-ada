with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

with Bag_Package;
procedure Main is
	type Element is new Natural;
	type Index is new Positive;
	type Element_Array is array (Index range <>) of Element;

	package Natural_Bag is new Bag_Package(Element, Index, Element_Array);
	use Natural_Bag;

	procedure Print_Bag_Element(Elem: Element; Mul: Natural) is
	begin
		Put_Line("Elem=" & Trim(Element'Image(Elem), Ada.Strings.Left) & ",Mul=" & Trim(Natural'Image(Mul), Ada.Strings.Left));
	end Print_Bag_Element;
	procedure Print_Bag is new Natural_Bag.Apply_All(Print_Bag_Element);

	Singleton_B  : Bag(Index'First);
	Bag_Size     : Index := Index'First + 3;
	B            : Bag(Bag_Size);

	Elements : Element_Array := (1,2,3,4,5);


begin
	Insert_One(Singleton_B, 9);
	Insert_One(Singleton_B, 10); -- This element won't be added to the bag
	Print_Bag(Singleton_B);
	New_Line;

	Extract_One(Singleton_B, 9);
	Print_Bag(Singleton_B);
	New_Line;


	Put_Line("Bag is empty=" & Boolean'Image(Is_Empty(B))); -- Should be empty
	Insert_Many(B, Elements);
	Put_Line("Bag is empty=" & Boolean'Image(Is_Empty(B))); -- Should have four elements
	Print_Bag(B);
	New_Line;

	Extract_One(B, 1);
	Print_Bag(B);
	New_Line;

	Extract_Many(B, Elements);
	Put_Line("Bag is empty=" & Boolean'Image(Is_Empty(B)));
	Print_Bag(B); -- Prints nothing
	New_Line;


end Main;
