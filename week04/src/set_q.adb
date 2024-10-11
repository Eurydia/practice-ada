package body Set_Q is

   function Numberator(R: Rational) return Integer is 
	begin
		return R.Numberator;
	end Numberator; 
	function Denominator(R: Rational) return Positive is
	begin 
		return R.Denominator;
	end Denominator;

	function "/"(Numberator : Integer; Denominator: Positive) return Rational is
	begin
		return Normalize(Numberator, Denominator);
	end "/";
	
	function "/"(X,Y: Rational) return Rational is 
	begin
		return Normalize(X.Numberator * Y.Denominator, X.Denominator * Y.Numberator);
	end "/";
	
	function "/"(X: Rational; Y:Positive) return Rational is
	begin
		return Normalize(X.Numberator, X.Denominator * Y); 
	end "/";
	
	
	function "+"(X,Y: Rational) return Rational is
	begin
		return Normalize((X.Numberator * Y.Denominator) + (Y.Numberator * X.Denominator), X.Denominator * Y.Denominator);
	end "+";
	
	function "*"(X,Y: Rational) return Rational is
	begin
		return Normalize(X.Numberator * Y.Numberator, X.Denominator * Y.Denominator);
	end "*";


	function Gcd(X,Y: Positive) return Positive is 
		A : Positive := X;
		B: Natural := Y;
		Tmp: Natural;
	begin
		while B /= 0 loop
			Tmp := A mod B;
			A := B;
			B := Tmp;
		end loop;
		return A;
	end Gcd;
	
	function Normalize(Numberator: Integer; Denominator: Positive) return Rational is
	begin
		if Numberator = 0 then
			return (0,1);
		else
			declare
				H : Positive := Gcd(abs(Numberator), Denominator);
			begin 
				return (Numberator / H, Denominator / H);
			end;
		end if;
	end Normalize;
	

end Set_Q;
