with Ada.Assertions; use Ada.Assertions;
package body Selection with SPARK_Mode is


   procedure Sort (A : in out Arr) is
      min : Integer;
      c : Integer;
   begin
      for I in A'First .. A'Last-1 loop
         min := I;
         for J in I .. A'Last loop

            if A(J) < A(min) then
               min := J;
            end if;
            pragma Loop_Invariant(min in I .. A'Last);
            pragma Loop_Invariant (for all M in I .. J => A(M) >= A(min));
         end loop;
         c := A(i);
         A(i) := A(min);
         A(min) := c;
         pragma Loop_Invariant (for all J in I+1 .. A'last => A(I) <= A(J));
         --pragma Loop_Invariant (for all J in A'First .. I =>
         --                         (for all K in I+1 .. A'Last =>
         --                            A(J) <= A(K)));
         pragma Loop_Invariant (Sorted (A (A'First .. I)));
--         pragma Loop_Invariant (Sorted (A (A'First .. I)));
      end loop;
      --pragma Assert((Sorted(A(A'First .. A'Last))));

   end Sort;

end Selection;
