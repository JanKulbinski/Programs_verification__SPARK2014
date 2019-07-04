package Poly with SPARK_Mode is

   type Vector is array (Natural range <>) of Integer;

   function Sum (X : Integer; A : Vector) return Integer
     with Ghost,
     Pre => A'Length > 0;


   function Horner (X : Integer; A : Vector) return Integer
     with
       Pre => A'Length > 0 and
       A'Last <= Integer'Last,
       Post => Horner'Result = Sum(X,A);
end Poly;
