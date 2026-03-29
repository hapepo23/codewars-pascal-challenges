{
6 kyu
Reversing a Process
https://www.codewars.com/kata/5dad6e5264e25a001918a1fc
}

unit reversing_a_process_unit;

{$mode objfpc}{$H+}

interface

function Decode(s: string): string;

implementation

uses
  SysUtils;

function Decode(s: string): string;
const
  orda = Ord('a');
  cc = 26;
var
  i, l, pos, num, mi: integer;
begin
  l := Length(s);
  pos := 1;
  while (pos <= l) and (s[pos] >= '0') and (s[pos] <= '9') do
    Inc(pos);
  if (pos = 1) or (pos > l) then
    Exit('Impossible to decode');
  num := StrToInt(LeftStr(s, pos - 1)) mod cc;
  mi := -1;
  for i := 1 to cc - 1 do
    if ((num * i) mod cc) = 1 then
    begin
      mi := i;
      Break;
    end;
  if mi = -1 then
    Exit('Impossible to decode');
  SetLength(Result, l - pos + 1);
  for i := pos to l do
    Result[i - pos + 1] :=
      Chr((((((Ord(s[i]) - orda) * mi) mod cc) + cc) mod cc) + orda);
end;

end.
