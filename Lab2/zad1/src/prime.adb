with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Prime with SPARK_Mode is
   function IsPrime (N : in Positive) return Boolean is
   I : Integer; 
   begin
      I := 2;
      while I < N loop
         pragma Loop_Invariant(for all J in 2 .. I - 1 => N rem J /= 0);
         pragma Loop_Invariant(I >= 2);  
         if N rem I = 0 then
             pragma Assert (for some I in 2 .. N - 1 => N rem I = 0);
            return false;
         end if;
         I := I + 1;                      
      end loop;
      pragma Assert(for all J in 2 .. N - 1 => N rem J /= 0);
      return true;
   end IsPrime;
end Prime;
