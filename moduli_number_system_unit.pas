{
6 kyu
Moduli number system
https://www.codewars.com/kata/54db15b003e88a6a480000b9
}

unit moduli_number_system_unit;

{$mode objfpc}{$H+}

interface

type
  TIntegerArray = array of int64;

function FromNb2Str(n: int64; sys: TIntegerArray): string;

implementation

uses
  SysUtils;

function GCD(a, b: int64): int64;
begin
  while b <> 0 do
  begin
    a := a mod b;
    if a = 0 then
      Exit(b);
    b := b mod a;
  end;
  Result := a;
end;

function FromNb2Str(n: int64; sys: TIntegerArray): string;
var
  i, j: integer;
  product: int64;
begin
  for i := 0 to High(sys) do
    for j := i + 1 to High(sys) do
      if GCD(sys[i], sys[j]) <> 1 then
        Exit('Not applicable');
  product := 1;
  for i := 0 to High(sys) do
  begin
    product := product * sys[i];
    if product <= 0 then
      Exit('Not applicable');
  end;
  if product <= n then
    Exit('Not applicable');
  Result := '';
  for i := 0 to High(sys) do
    Result += '-' + IntToStr(n mod sys[i]) + '-';
end;

end.
