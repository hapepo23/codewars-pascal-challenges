{
7 kyu
How Green Is My Valley?
https://www.codewars.com/kata/56e3cd1d93c3d940e50006a4
}

unit how_green_is_my_valley_unit;

{$mode objfpc}{$H+}

interface

type
  TInt64Array = array of int64;

function MakeValley(arr: TInt64Array): TInt64Array;

implementation

uses
  Generics.Collections;

function MakeValley(arr: TInt64Array): TInt64Array;
var
  sorted: TInt64Array;
  i, j, k: integer;
  bottom: boolean;
begin
  sorted := [];
  SetLength(sorted, Length(arr));
  for i := 0 to High(arr) do
    sorted[i] := arr[i];
  specialize TArrayHelper<int64>.Sort(sorted);
  Result := [];
  SetLength(Result, Length(arr));
  j := 0;
  k := High(sorted);
  bottom := False;
  for i := High(sorted) downto 0 do
  begin
    if bottom then
    begin
      Result[k] := sorted[i];
      Dec(k);
    end
    else
    begin
      Result[j] := sorted[i];
      Inc(j);
    end;
    bottom := not bottom;
  end;
  sorted := nil;
end;

end.
