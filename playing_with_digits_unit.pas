{
6 kyu
Playing with digits
https://www.codewars.com/kata/5552101f47fc5178b1000050
}

unit playing_with_digits_unit;

{$mode objfpc}{$H+}

interface

function DigPow(n, p: int64): int64;

implementation

uses
  SysUtils,
  Math;

function DigPow(n, p: int64): int64;
const
  zero = Ord('0');
var
  nstr: string;
  c: char;
  val, digit: int64;
begin
  nstr := IntToStr(n);
  val := 0;
  for c in nstr do
  begin
    digit := Ord(c) - zero;
    val := val + digit ** p;
    Inc(p);
  end;
  if val mod n = 0 then
    Result := val div n
  else
    Result := -1;
end;

end.
