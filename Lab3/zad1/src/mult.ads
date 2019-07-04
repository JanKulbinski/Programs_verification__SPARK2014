package Mult with SPARK_Mode is
   function mult (A : Natural; B : Natural) return Natural
     with
       Pre => A < 32768 and B < 32768,
     Post => Mult'Result = A * B;
   end Mult;
