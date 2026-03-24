{
5 kyu
Closest and Smallest
https://www.codewars.com/kata/5868b2de442e3fb2bb000119
}

unit closest_and_smallest_unit;

{$mode objfpc}{$H+}

interface

type
  TClosestSmallestArray = array of array[0..2] of int64;

function Closest(strng: string): TClosestSmallestArray;

implementation

uses
  Generics.Collections,
  Generics.Defaults,
  StrUtils,
  SysUtils,
  Types;

type
  TNuminfo = record
    number: int64;
    position: int64;
    weight: int64;
  end;
  TNuminfoList = specialize TList<TNuminfo>;
  TNuminfoComparer = specialize TComparer<TNuminfo>;

function CompareNuminfo(constref L, R: TNuminfo): integer;
begin
  { weight ascending }
  if L.weight < R.weight then
    Result := -1
  else if L.weight > R.weight then
    Result := 1
  else
  begin
    { if equal: position ascending }
    if L.position < R.position then
      Result := -1
    else if L.position > R.position then
      Result := 1
    else
      Result := 0;
  end;
end;

function DigitSum(num: int64): int64;
begin
  Result := 0;
  while (num <> 0) do
  begin
    Result := Result + (num mod 10);
    num := num div 10;
  end;
end;

function Closest(strng: string): TClosestSmallestArray;
var
  nums: TStringDynArray;
  list: TNuminfoList;
  temp: TNuminfo;
  i, j, diff, diffmin: int64;
begin
  if strng = '' then
    Exit([]);
  nums := SplitString(strng, ' ');
  list := TNuminfoList.Create;
  for i := Low(nums) to High(nums) do
  begin
    temp.position := i;
    temp.number := StrToInt(nums[i]);
    temp.weight := DigitSum(temp.number);
    list.Add(temp);
  end;
  list.Sort(TNuminfoComparer.Construct(@CompareNuminfo));
  diffmin := High(int64);
  for i := 0 to list.Count - 2 do
  begin
    diff := list.Items[i + 1].weight - list.Items[i].weight;
    if diff < diffmin then
    begin
      diffmin := diff;
      j := i;
    end;
  end;
  SetLength(Result, 2);
  for i := 0 to 1 do
  begin
    Result[i][0] := list.Items[j + i].weight;
    Result[i][1] := list.Items[j + i].position;
    Result[i][2] := list.Items[j + i].number;
  end;
  FreeAndNil(list);
end;

end.
