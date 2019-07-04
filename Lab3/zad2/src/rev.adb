with Ada.Text_IO; use Ada.Text_IO;
package body Rev with SPARK_Mode is

   procedure rev (S : in out String) is
      oldS : String := S;

   begin
      for I in S'First .. S'Last loop

         S(I) := oldS(oldS'First + oldS'Last - I);

         pragma Loop_Invariant (for all J in S'First .. I => S(J) = oldS(oldS'First + oldS'Last - J));

      end loop;

   end rev;
end Rev;
