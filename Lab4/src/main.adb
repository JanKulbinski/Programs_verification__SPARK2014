with Ada.Text_IO; use Ada.Text_IO;
with Railway; use Railway;

procedure Main is
   success : Boolean := false;
begin

   Open_Route (Route_Enter_Right,success);
   Put_Line(Boolean'Image(success));

   Move_Train (Route_Enter_Right,success);
   Put_Line(Boolean'Image(success));

   Open_Route (Route_Right_Middle,success);
   Put_Line(Boolean'Image(success));

   Move_Train (Route_Right_Middle,success);
   Put_Line(Boolean'Image(success));

   Open_Route (Route_Middle_Left,success);
   Put_Line(Boolean'Image(success));

   Move_Train (Route_Middle_Left,success);
   Put_Line(Boolean'Image(success));

   Open_Route (Route_Left_Middle,success);
   Put_Line(Boolean'Image(success));

   Move_Train (Route_Middle_Right,success);
   Put_Line(Boolean'Image(success));

end Main;
