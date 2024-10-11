with Ada.Text_IO; use Ada.Text_IO;

package body Bag is

 
	procedure Print(B: Bag_T) is
	begin
		for I in Bag_Elem'Range loop
			Put_Line("Item="Bag_Elem'Image(I) & ",Multiplicity=" & Bag_Elem_Multiplicity'Image(B.Items(I)));
		end loop;
	end Print;
	
	procedure Insert_One(B: in out Bag_T; E: Bag_Elem) is
	begin
		B.Items(E) := Bag_Elem_Multiplicity'Succ(B.Items(E));
	end Insert_One;
	procedure Insert_Many(B: in out Bag_T; Es: Bag_Container) is
	begin
		for E in Bag_Elem'Range loop
			B.Items(E) := B.Items(E) + Es(E);
		end loop;
	end Insert_Many;
	procedure Extract_One(B: in out Bag_T; E: Bag_Elem) is 
	begin
		B.Items(E) := Bag_Elem_Multiplicity'Pred(B.Items(E));
	end Extract_One;
	procedure Extract_Multiple(B: in out Bag_T; Es: Bag_Container) is
	begin
		for E in Bag_Elem'Range loop
			B.Items(E) := B.Items(E) - Es(E);
		end loop;
	end Insert_Many
	
end Bag;
