with Rev;
with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
  Message : String (1 .. 11) := "dlroW olleH";
begin
   Rev.rev(Message);
   Put_Line(Message);
   null;
end Main;
