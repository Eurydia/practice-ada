with Ada.Integer_Text_IO;

procedure MaxTwo is
   A: Integer;
   B: Integer;
begin
   Ada.Integer_Text_IO.Get(A);
   Ada.Integer_Text_IO.Get(B);

   if A >= B then
   Ada.Integer_Text_IO.Put(A);
else
   Ada.Integer_Text_IO.put(B);
         end if;
      end MaxTwo;
