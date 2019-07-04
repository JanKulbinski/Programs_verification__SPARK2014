with Ada.Text_IO; use Ada.Text_IO;
with Factor; use Factor;
procedure Main is

   Number : Positive := 6;
   Factor : Positive := 2;
begin
   Smallest_Factor(Number,Factor);
   Put_Line("Factor = " & Integer'Image(Factor));
   Put_Line("N = " & Integer'Image(Number));
end Main;
