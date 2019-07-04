with Ada.Text_IO; use Ada.Text_IO;
with Max2; use Max2;

procedure Main is

begin
   Put(Integer'Image(FindMax2((2,3,4,5,6,1))));
   Put(Integer'Image(FindMax2((1,1,1,1,1,1))));
end Main;
