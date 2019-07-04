with Ada.Assertions; use Ada.Assertions;
package body Poly with SPARK_Mode is

   function Sum (X : Integer; A : Vector) return Integer is
      Y : Integer := 0;
      J : Integer := 0;
   begin
      for I in A'First .. A'Last loop
         Y := Y + (X**J)*A(I);
         J := J+1;
         pragma Loop_Invariant(J > 0);
      end loop;
      return Y;
   end Sum;

   function Horner (X : Integer; A : Vector) return Integer is
     Y : Integer := 0;
   begin
      for I in reverse A'First .. A'Last loop

         Y := A(I) + X*Y;
         pragma Assume (Y = Sum(X, A(I .. A'Last)));
      end loop;
         --pragma Assume (Sum(X,A) = Y);
      return Y;
   end Horner;

end Poly;
