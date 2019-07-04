with Ada.Integer_Text_IO;
with Poly;
with Ada.Containers.Vectors;

procedure Main is
begin
   Ada.Integer_Text_IO.Put(Poly.Horner(1,(2,3,4)));
   null;
end Main;
