package Matrix_Intros is

	type Index is new Integer;
	type Elem is new Integer;
	type Matrix is array (Index range <>, Index range <>) of Elem;
	
	
	procedure Add(A: in out Matrix; B in Matrix);
	procedure Mul(E: in Elem; B: in out Matrix);

	function Diagonal(M: Matrix) return Elem;
	function "+"(A: Matrix; B: Matrix) return Matrix;
	function "*"(A: Matrix; B: Matrix) return Matrix;
	function "*"(E: Elem; M: Matrix) return Matrix;
	
	

end Matrix_Intros;
