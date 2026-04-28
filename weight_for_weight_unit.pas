{
5 kyu
Weight for weight
https://www.codewars.com/kata/55c6126177c9441a570000cc
}

unit weight_for_weight_unit;

{$mode objfpc}{$H+}

interface

function OrderWeight(s: string): string;

implementation

uses
  SysUtils,
  Generics.Collections,
  Generics.Defaults;

type
  TStrArray = array of string;
  TStringComparer = specialize TComparer<string>;

function DigitSum(s: string): integer;
const
  ordzero = Ord('0');
var
  c: char;
begin
  Result := 0;
  for c in s do
    Result += Ord(c) - ordzero;
end;

function Compare(constref L, R: string): integer;
var
  dsl, dsr: integer;
begin
  dsl := DigitSum(L);
  dsr := DigitSum(R);
  if dsl > dsr then
    Result := 1
  else if dsl < dsr then
    Result := -1
  else
    Result := CompareStr(L, R);
end;

function OrderWeight(s: string): string;
var
  items: TStrArray;
begin
  items := s.Split([' '], TStringSplitOptions.ExcludeEmpty);
  specialize TArrayHelper<string>.Sort(items,
    TStringComparer.Construct(@Compare));
  Result := string.Join(' ', items);
end;

end.
