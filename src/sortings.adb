with Ada.Text_IO;

package body Sortings is

   generic
      type Element is private;
   procedure Generic_Swap (A, B : in out Element);

   procedure Generic_Swap (A, B : in out Element) is
      Temp : constant Element := A;
   begin
      A := B;
      B := Temp;
   end;

   procedure Generic_Quicksort (Item : in out Vector) is
      procedure Swap is new Generic_Swap (Element);
      pragma Suppress (Overflow_Check);
      pragma Suppress (Range_Check);
      Pivot : Element;
      Left : Index;
      Right : Index;
   begin
      if Item'Length > 1 then
         Pivot := Item (Item'Last);
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









   procedure Generic_Rosetta_Quicksort (Item : in out Element_Array) is

      procedure Swap(Left, Right : in out Element_Type) is
         Temp : constant Element_Type := Left;
      begin
         Left := Right;
         Right := Temp;
      end Swap;

      Pivot_Index : Index_Type;
      Pivot_Value : Element_Type;
      Right       : Index_Type := Item'Last;
      Left        : Index_Type := Item'First;

   begin
      if Item'Length > 1 then
         Pivot_Index := Index_Type'Val((Index_Type'Pos(Item'Last) + 1 +
                                         Index_Type'Pos(Item'First)) / 2);
         Pivot_Value := Item(Pivot_Index);

         Left  := Item'First;
         Right := Item'Last;
         loop
            while Left < Item'Last and then Item(Left) < Pivot_Value loop
               Left := Index_Type'Succ(Left);
            end loop;
            while Right > Item'First and then Item(Right) > Pivot_Value loop
               Right := Index_Type'Pred(Right);
            end loop;
            exit when Left >= Right;
            Swap(Item(Left), Item(Right));
            if Left < Item'Last then
               Left := Index_Type'Succ(Left);
            end if;
            if Right > Item'First then
               Right := Index_Type'Pred(Right);
            end if;
         end loop;
         if Right > Item'First then
            Generic_Rosetta_Quicksort (Item(Item'First..Index_Type'Pred(Right)));
         end if;
         if Left < Item'Last then
            Generic_Rosetta_Quicksort (Item(Left..Item'Last));
         end if;
      end if;
   end;














end;
