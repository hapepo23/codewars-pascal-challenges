{
6 kyu
Reverse or rotate?
https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991
}

unit reverse_or_rotate_unit;

{$mode objfpc}{$H+}

interface

function RevRot(str: string; sz: int64): string;

implementation

uses
  StrUtils;

function DigitSum(num: string): int64;
const
  zero: integer = Ord('0');
var
  c: char;
begin
  Result := 0;
  for c in num do
    Result := Result + Ord(c) - zero;
end;

function RevRot(str: string; sz: int64): string;
var
  i, l, n: int64;
  chunk: string;
begin
  l := Length(str);
  if (l = 0) or (sz <= 0) then
    Exit('');
  n := l div sz;
  Result := '';
  for i := 1 to n do
  begin
    chunk := Copy(str, (i - 1) * sz + 1, sz);
    if DigitSum(chunk) mod 2 = 0 then
      chunk := ReverseString(chunk)
    else
      chunk := Rightstr(chunk, sz - 1) + LeftStr(chunk, 1);
    Result := Result + chunk;
  end;
end;

end.
