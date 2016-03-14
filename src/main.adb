with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Strings;
with Ada.Strings.Fixed;

procedure Main is

   generic
      type Element is private;
   procedure Generic_Swap (A, B : in out Element);
   procedure Generic_Swap (A, B : in out Element) is
      Temp : constant Element := A;
   begin
      A := B;
      B := Temp;
   end;

   generic
      type Index is (<>);
      type Element is private;
      type Vector is array (Index range <>) of Element;
      with function "<" (Left, Right : Element) return Boolean is <>;
      with function ">" (Left, Right : Element) return Boolean is <>;
   procedure Generic_Quicksort (Item : in out Vector);
   procedure Generic_Quicksort (Item : in out Vector) is
      procedure Swap is new Generic_Swap (Element);
      pragma Suppress (Overflow_Check);
      pragma Suppress (Range_Check);
      Pivot : Element;
      Left : Index;
      Right : Index;
   begin
      if Item'Length > 1 then
         Pivot := Item (Item'Last); -- Choose the pivot element.
         Left := Item'First;
         Right := Item'Last;
         while Left <= Right loop
            while Item (Left) < Pivot loop
               Left := Index'Succ (Left);
            end loop;
            while Item (Right) > Pivot loop
               Right := Index'Pred (Right);
            end loop;
            if Left <= Right then
               Swap (Item (Left), Item (Right));
               Left := Index'Succ (Left);
               Right := Index'Pred (Right);
            end if;
         end loop;
         Generic_Quicksort (Item (Item'First .. Right));
         Generic_Quicksort (Item (Left .. Item'Last));
      end if;
   end;

   type Planet is (Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune, Pluto);
   type Planet_Season_Array is array (Planet range <>) of Float;
   procedure Sort is new Generic_Quicksort (Planet, Float, Planet_Season_Array);
   procedure Put (Item : Planet_Season_Array) is
      use Ada.Text_IO;
      use Ada.Float_Text_IO;
      use Ada.Strings.Fixed;
   begin
      for I in Item'Range loop
         Put (Tail (I'Img, Planet'Width));
         Put (Item (I), 2, 2, 0);
         New_Line;
      end loop;
      New_Line;
   end;

   Item : Planet_Season_Array (Planet) := (0.8, 0.1, 0.4, 0.9, 0.0, 0.7, 0.5, 0.3, 0.7);

begin
   Put (Item);
   Sort (Item);
   Put (Item);
end;
