package body Railway with SPARK_Mode is

 -- and then => short circuit  
   procedure Open_Route (Route: in Route_Type; Success: out Boolean)
   is
   begin
      Success := True;
      
      if Route = Route_Left_Middle then
        if Segment_State.Left = Occupied_Standing and then Segment_State.Middle = Free then
         Signal_State.Left_Middle := Green;
         Segment_State.Left := Occupied_Moving_Right;
         Segment_State.Middle := Reserved_Moving_From_Left;
        end if;
      
      elsif Route = Route_Middle_Right then
        if Segment_State.Middle = Occupied_Standing and then Segment_State.Right = Free then
         Signal_State.Middle_Right := Green;
         Segment_State.Middle := Occupied_Moving_Right;
         Segment_State.Right := Reserved_Moving_From_Left;
        end if;
      
      elsif Route = Route_Middle_Left then
        if Segment_State.Middle = Occupied_Standing and then Segment_State.Left = Free then
         Signal_State.Middle_Left := Green;
         Segment_State.Middle := Occupied_Moving_Left;
         Segment_State.Left := Reserved_Moving_From_Right;
        end if;
      
      elsif Route = Route_Right_Middle then
        if Segment_State.Right = Occupied_Standing and then Segment_State.Middle = Free then
         Signal_State.Right_Middle := Green;
         Segment_State.Middle := Reserved_Moving_From_Right;
         Segment_State.Right := Occupied_Moving_Left;
        end if;

      elsif Route = Route_Enter_Left and then
          Segment_State.Left = Free then
         Segment_State.Left := Reserved_Moving_From_Left;

      elsif Route = Route_Enter_Right and then
         Segment_State.Right = Free then
         Segment_State.Right := Reserved_Moving_From_Right;

      elsif Route = Route_Leave_Left and then
         Segment_State.Left = Occupied_Standing then
         Segment_State.Left := Occupied_Moving_Left;

      elsif Route = Route_Leave_Right and then 
        Segment_State.Right = Occupied_Standing then
         Segment_State.Right := Occupied_Moving_Right;
      
      else
        Success := False;
      end if;
end Open_Route;

   procedure Move_Train (Route: in Route_Type; Success: out Boolean)
   is
   begin
   
   Success := True;
   
   if Route = Route_Left_Middle then
      if Segment_State.Left = Occupied_Moving_Right and then 
        Segment_State.Middle = Reserved_Moving_From_Left then
         Signal_State.Left_Middle := Red;
         Segment_State.Left := Free;
         Segment_State.Middle := Occupied_Standing;
      end if;
      
   elsif Route = Route_Middle_Right then 
        if Segment_State.Middle = Occupied_Moving_Right and then 
        Segment_State.Right = Reserved_Moving_From_Left then
         Signal_State.Middle_Right := Red;
         Segment_State.Middle := Free;
         Segment_State.Right := Occupied_Standing;
      end if;
      
   elsif Route = Route_Right_Middle then 
        if Segment_State.Right = Occupied_Moving_Left and then
        Segment_State.Middle = Reserved_Moving_From_Right then
         Signal_State.Right_Middle := Red;
         Segment_State.Right := Free;
         Segment_State.Middle := Occupied_Standing;
      end if;
      
   elsif Route = Route_Middle_Left then 
      if Segment_State.Middle = Occupied_Moving_Left and then
        Segment_State.Left = Reserved_Moving_From_Right then
         Signal_State.Middle_Left := Red;
         Segment_State.Middle := Free;
         Segment_State.Left := Occupied_Standing;
      end if;
      
      elsif Route = Route_Enter_Left and then Segment_State.Left = Reserved_Moving_From_Left then
         Segment_State.Left := Occupied_Standing;

      elsif Route = Route_Leave_Left and then Segment_State.Left = Occupied_Moving_Left then
         Segment_State.Left := Free;

      elsif Route = Route_Enter_Right and then Segment_State.Right = Reserved_Moving_From_Right then
         Segment_State.Right := Occupied_Standing;

      elsif Route = Route_Leave_Right and then Segment_State.Right = Occupied_Moving_Right then
         Segment_State.Right := Free;

   else Success := False;
      
      end if;

end Move_Train;

end Railway;
