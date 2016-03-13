with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
with Sortings;

procedure Main is

   generic
      type Element is private;
      type Index is (<>);
      type Vector is array (Index range <>) of Element;
      with procedure Put (Item : Element);
   procedure Generic_Put_Vector (Item : Vector);

   procedure Generic_Put_Vector (Item : Vector) is
      use Ada.Text_IO;
   begin
      for E of Item loop
         Put (E);
         New_Line;
      end loop;
   end;


   type Natural_Float is new Float range 0.0 .. Float'Last;
   type Planet is (Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune, Pluto);

   procedure Put (Item : Natural_Float) is
   begin
      Ada.Float_Text_IO.Put (Float (Item), 3, 3, 0);
   end;

   procedure Put (Item : Integer) is
   begin
      Ada.Integer_Text_IO.Put (Item, 3);
   end;

   type Integer_Array is array (Positive range <>) of Integer;
   type Planet_Distance_Array is array (Planet range <>) of Natural_Float;

   procedure Sort is new Sortings.Generic_Quicksort (Natural_Float, Planet, Planet_Distance_Array);
   procedure Sort is new Sortings.Generic_Quicksort (Integer, Positive, Integer_Array);
   procedure Rosetta_Sort is new Sortings.Generic_Rosetta_Quicksort (Natural_Float, Planet, Planet_Distance_Array);
   procedure Rosetta_Sort is new Sortings.Generic_Rosetta_Quicksort (Integer, Positive, Integer_Array);

   procedure Put is new Generic_Put_Vector (Natural_Float, Planet, Planet_Distance_Array, Put);
   procedure Put is new Generic_Put_Vector (Integer, Positive, Integer_Array, Put);

   A : Integer_Array := (1, 3, 0, -3, 3, 5, 6, -4);
   B : Planet_Distance_Array (Planet) := (0.39, 0.723, 1.0, 1.524, 5.203, 9.539, 19.18, 30.06, 39.53);


begin

   Sort (A (2 .. 6));
   Put (A);
   Sort (B (Earth .. Pluto));
   Put (B);

   null;
end;
