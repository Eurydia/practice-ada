package Bag is

	type Bag_T is private;
	type Bag_Elem is new Integer range 1..100;
	type Bag_Elem_Multiplicity is new Integer range 0..100;
	type Bag_Container is array (Bag_Elem) of Bag_Elem_Multiplicity;
	
	procedure Print(B: Bag_T);
	procedure Insert_One(B: in out Bag_T; E: Bag_Elem);
	procedure Insert_Many(B: in out Bag_T; Es: Bag_Container);
	procedure Extract_One(B: in out Bag_T; E: Bag_Elem);
	procedure Extract_Multiple(B: in out Bag_T; Es: Bag_Container);
	
private
	type Bag_T is record
		Items: Bag_Container := (others => 0);
	end record;

end Bag;
