{
6 kyu
Prize Draw
https://www.codewars.com/kata/5616868c81a0f281e500005c
}

unit prize_draw_unit;

{$mode objfpc}{$H+}

interface

type
  TIntArray = array of int64;

function Rank(s: string; we: TIntArray; n: int64): string;

implementation

uses
  Generics.Collections,
  Generics.Defaults,
  StrUtils,
  SysUtils,
  Types;

type
  TNameWinNum = record
    firstname: string;
    winnumber: int64;
  end;
  TNameWinNumList = specialize TList<TNameWinNum>;
  TNameWinNumComparer = specialize TComparer<TNameWinNum>;

function CompareNameWinNum(constref L, R: TNameWinNum): integer;
begin
  { winnumber descending }
  if L.winnumber > R.winnumber then
    Result := -1
  else if L.winnumber < R.winnumber then
    Result := 1
  else
  begin
    { if equal: firstname ascending }
    if L.firstname < R.firstname then
      Result := -1
    else if L.firstname > R.firstname then
      Result := 1
    else
      Result := 0;
  end;
end;

function CalculateWinNum(firstname: string; weight: int64): int64;
var
  i, l, k: integer;
  n: string;
begin
  n := LowerCase(firstname);
  l := Length(firstname);
  k := Ord('a') - 1;
  Result := l;
  for i := 1 to l do
    Result := Result + Ord(n[i]) - k;
  Result := Result * weight;
end;

function Rank(s: string; we: TIntArray; n: int64): string;
var
  firstnames: TStringDynArray;
  list: TNameWinNumList;
  temp: TNameWinNum;
  i: int64;
begin
  if s = '' then
    Exit('No participants');
  firstnames := SplitString(s, ',');
  if n > Length(firstnames) then
    Exit('Not enough participants');
  list := TNameWinNumList.Create;
  for i := Low(firstnames) to High(firstnames) do
  begin
    temp.firstname := firstnames[i];
    temp.winnumber := CalculateWinNum(firstnames[i], we[i]);
    list.Add(temp);
  end;
  list.Sort(TNameWinNumComparer.Construct(@CompareNameWinNum));
  Result := list[n - 1].firstname;
  list.Free;
end;

end.
