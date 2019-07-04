with Selection;
with Ada.Text_IO;
procedure Main is
   A : Selection.Arr := (7,3,8);
begin

   Selection.Sort(A);
   for I in A'Range loop
   Ada.Text_IO.Put(Integer'Image(A(I)));
   end loop;
      null;
end Main;
