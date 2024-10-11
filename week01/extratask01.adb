
--  B9XP3X THANAKORN PHUTTHARAKSA
with Ada.Integer_Text_IO;
with Ada.Text_IO;

procedure ExtraTask01 is
   N: Natural;
   IsPrime: Boolean;
begin
   Ada.Integer_Text_IO.Get(N);
      Ada.Text_IO.Put(Integer'Image(N));

   if N <= 0 then
   Ada.Text_IO.Put(" is negative");
   elsif N = 1 then
      Ada.Text_IO.Put(" is not a prime");
   elsif N = 2 then
      Ada.Text_IO.Put(" is a prime");
   else
      IsPrime := True;
      for I in 2..N-1 loop
         IsPrime := (IsPrime and ((N mod I) /= 0));
                     end loop;
                     if IsPrime then
                        Ada.Text_IO.Put(" is prime");
                     else
                        Ada.Text_IO.Put(" is not a prime");
                        end if;
   end if;
   end ExtraTask01;
