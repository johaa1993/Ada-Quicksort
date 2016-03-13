package Sortings is

   generic
      type Element is private;
      type Index is (<>);
      type Vector is array (Index range <>) of Element;
      with function "<" (Left, Right : Element) return Boolean is <>;
      with function ">" (Left, Right : Element) return Boolean is <>;
   procedure Generic_Quicksort (Item : in out Vector);

   generic
      type Element_Type is private;
      type Index_Type is (<>);
      type Element_Array is array(Index_Type range <>) of Element_Type;
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
      with function ">" (Left, Right : Element_Type) return Boolean is <>;
   procedure Generic_Rosetta_Quicksort(Item : in out Element_Array);


end;
