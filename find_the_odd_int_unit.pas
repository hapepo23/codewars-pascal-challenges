{
6 kyu
Find the odd int
https://www.codewars.com/kata/54da5a58ea159efa38000836
}

unit find_the_odd_int_unit;

{$mode objfpc}{$H+}

interface

function FindOdd(arr: array of integer): integer;

implementation

uses
  Generics.Collections;

type
  TIntIntDictionary = specialize TDictionary<integer, integer>;
  TIntIntDictPair = specialize TDictionary<integer, integer>.TDictionaryPair;

function FindOdd(arr: array of integer): integer;
var
  counts: TIntIntDictionary;
  kv: TIntIntDictPair;
  i: integer;
begin
  counts := TIntIntDictionary.Create;
  for i := Low(arr) to High(arr) do
  begin
    if counts.ContainsKey(arr[i]) then
      counts.AddOrSetValue(arr[i], counts[arr[i]] + 1)
    else
      counts.Add(arr[i], 1);
  end;
  for kv in counts do
    if kv.Value mod 2 = 1 then
    begin
      Result := kv.Key;
      Exit;
    end;
  Result := -1;  { should not happen }
end;

end.
