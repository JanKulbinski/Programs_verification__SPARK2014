with Ada.Text_IO;
with Prime;

procedure Main is
N: Integer;
begin
   N := 37;
   if Prime.IsPrime(N) then
      Ada.Text_IO.Put_Line("Prime");
   else
      Ada.Text_IO.Put_Line("NOT Prime");
   end if;

   end Main;
