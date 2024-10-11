package Set_Q is

	type Rational is private;

	function Numberator(R: Rational) return Integer; 
	function Denominator(R: Rational) return Positive;

	function "/"(Numberator : Integer; Denominator: Positive) return Rational;
	function "/"(X,Y: Rational) return Rational;
	function "/"(X: Rational; Y:Positive) return Rational;
	
	function "+"(X,Y: Rational) return Rational;
	
	function "*"(X,Y: Rational) return Rational;
	
private


	function Gcd(X,Y: Positive) return Positive;
	function Normalize(Numberator: Integer; Denominator: Positive) return Rational;
	
	type Rational is record
		Numberator : Integer := 0;
		Denominator : Positive := 1;
	end record;

end Set_Q;
