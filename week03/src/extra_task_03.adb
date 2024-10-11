with Ada.Text_IO, Ada.Float_Text_IO;

procedure Extra_Task_03 is
	type Index is new Integer;
   type Matrix_Type is array (Index range <>, Index range <>) of Float;
   type Array_Type is array (Index range <>) of Float;


    Augmented_Matrix : Matrix_Type(1 .. 3, 1 .. 4) := 
      ((2.0, -1.0, 3.0, 9.0),
       (4.0, 2.0, 3.0, 19.0),
       (1.0, 1.0, 1.0, 6.0));

   Solution : Array_Type(Augmented_Matrix'Range(1));
	Factor: Float;


	procedure Print_Matrix(M: in Matrix_Type) is 
	begin 
		for I in M'Range(1) loop
			for J in M'Range(2) loop
				Ada.Float_Text_IO.Put(M(I,J));
			end loop;
			Ada.Text_IO.New_Line;
		end loop;
	end Print_Matrix;
   

begin
 -- Read matrix
 for I in Augmented_Matrix'Range(1) loop
 	For J in Augmented_Matrix'First(2).. Index'Pred(Augmented_Matrix'Last(2)) loop
 		Ada.Float_Text_IO.Get(Augmented_Matrix(I,J));
 	end loop;
 end loop;
 
 Ada.Text_IO.New_Line;
 
 -- Read last column
 For I in Augmented_Matrix'Range(1) loop
 	Ada.Float_Text_IO.Get(Augmented_Matrix( I, Augmented_Matrix'Last(2) ));
 end loop;
 


   -- Forward Elimination Process
   for K in Augmented_Matrix'First(2) .. Index'Pred(Augmented_Matrix'Last(2)) loop
      -- Partial pivoting to avoid division by zero
      for I in Index'Succ(K - Augmented_Matrix'First(2) + Augmented_Matrix'First(1)) .. Augmented_Matrix'Last(1) loop
			Factor := Augmented_Matrix(I, K) / Augmented_Matrix(K - Augmented_Matrix'First(2) + Augmented_Matrix'First(1), K);            
			for J in K .. Augmented_Matrix'Last(2) loop
				Augmented_Matrix(I, J) := Augmented_Matrix(I, J) - Factor * Augmented_Matrix(K - Augmented_Matrix'First(2) + Augmented_Matrix'First(1), J);
			end loop;
      end loop;
   end loop;



   -- Backward Substitution Process
   for i in reverse Augmented_Matrix'Range(1) loop
      Solution(i) := Augmented_Matrix(i, Augmented_Matrix'Last(2));
      for j in i - Augmented_Matrix'First(1) + Augmented_Matrix'First(2) .. Index'Pred(Augmented_Matrix'Last(2)) loop
         Solution(i) := Solution(i) - Augmented_Matrix(i, j) * Solution(j - Augmented_Matrix'First(2) + Augmented_Matrix'First(1));
      end loop;
      Solution(i) := Solution(i) / Augmented_Matrix(i, i - Augmented_Matrix'First(1) + Augmented_Matrix'First(2));
   end loop;

   -- Display the solution
   Ada.Text_IO.Put_Line("Solutions:");
   for i in Solution'Range loop
      Ada.Float_Text_IO.Put(Solution(i));
      Ada.Text_IO.New_Line;
   end loop;
end Extra_Task_03;
