{
8 kyu
Function 1 - hello world
https://www.codewars.com/kata/523b4ff7adca849afe000035
}

unit hello_world_unit;

{$mode objfpc}{$H+}

interface

function Greet(): string;

implementation

uses
  SysUtils,
  Generics.Collections,
  Generics.Defaults;

type
  TIntList = specialize TList<integer>;
  TIntComparer = specialize TComparer<integer>;

function CompareInt(constref L, R: integer): integer;
begin
  if L < R then
    Result := -1
  else if L > R then
    Result := 1
  else
    Result := 0;
end;

function Greet(): string;
const
  Data = '560329710022101891149903341108911083410867119111044511187111';
  k = 5;
  m = 1000;
var
  list: TIntList;
  i: integer = 1;
begin
  list := TIntList.Create;
  while i < Length(Data) do
  begin
    list.Add(StrToInt(Copy(Data, i, k)));
    i := i + k;
  end;
  list.Sort(TIntComparer.Construct(@CompareInt));
  Result := '????????????';
  for i := 0 to list.Count - 1 do
    Result[i + 1] := Chr(list[i] mod m);
  FreeAndNil(list);
end;

end.
