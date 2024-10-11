generic
	type Element is private;
	type Index is (<>);
	type Element_Array is array (Index range <>) of Element;
package Bag_Package is

	type Bag(Max: Index) is limited private;
	type Bag_Element is private;
	
	procedure Insert_One(B: in out Bag; Elem: Element);
	procedure Insert_Many(B: in out Bag; Elems: Element_Array);
	procedure Extract_One(B: in out Bag; Elem: Element);
	procedure Extract_Many(B: in out Bag; Elems: Element_Array);
	function Is_Empty(B: Bag) return Boolean;
	
	generic
		with procedure Fn(Elem: in Element; Mul: in Natural);
	procedure Apply_All(B: Bag);
	
	
	
private

	type Bag_Element is record
		Elem: Element;
		Mul: Natural := 0;
	end record;
	type Bag_Element_Container is array (Index range <>) of Bag_Element;
	type Bag(Max: Index) is record
		Elements: Bag_Element_Container(Index'First..Max);
		Size: Natural := 0;
		Last: Index := Index'First;
	end record;

	function New_Bag_Element(Elem: Element) return Bag_Element;

end Bag_Package;
