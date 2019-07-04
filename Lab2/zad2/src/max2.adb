package body Max2 with SPARK_Mode is

   function FindMax2 (V : Vector) return Integer is

      maks: Integer;
      maks2: Integer;

   begin
      maks := V(V'First);
      maks2 :=  0;

      for I in V'First + 1 .. V'Last loop
         if V(i) > maks then
            maks2:= maks;
            maks:=  V(i);
         elsif V(i) > maks2 and V(i) /= maks then
            maks2 := V(i);
         else
            null;
         end if;
       pragma Loop_Invariant (for all K in V'First .. I => V(K) <= maks);
       pragma Loop_Invariant (for all K in V'First .. I =>
                              ((V(K) <= maks2) or V(K) = maks));
       pragma Loop_Invariant(for some J in  V'First .. I => (maks = V(J)));
       pragma Loop_Invariant(maks2 = 0 or (for some J in  V'First .. I => (maks2 = V(J))));
      end loop;

      pragma Assert (maks2 >= 0);
      pragma Assert (if (maks2 /= 0) then (for all I in V'Range => (if (maks2 < V(I)) then
                                                                      (for all J in V'Range => V(J) <= V(I)) )));
      pragma Assert (if (maks2 /= 0) then (for some I  in V'Range => (V(I) = maks2)));

      return maks2;
   end FindMax2;
end Max2;
