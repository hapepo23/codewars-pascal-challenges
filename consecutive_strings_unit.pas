{
6 kyu
Consecutive strings
https://www.codewars.com/kata/56a5d994ac971f1ac500003e
}

unit consecutive_strings_unit;

{$mode objfpc}{$H+}

interface

type
  TStringArray = array of string;

function LongestConsec(strarr: TStringArray; k: int64): string;

implementation

function LongestConsec(strarr: TStringArray; k: int64): string;
var
  i, n, m, mi, s: integer;
begin
  n := Length(strarr);
  if (n = 0) or (k > n) or (k <= 0) then
    Exit('');
  s := 0;
  for i := 0 to k - 1 do
    s += Length(strarr[i]);
  m := s;
  mi := 0;
  for i := 1 to n - k do
  begin
    s := s - Length(strarr[i - 1]) + Length(strarr[i + k - 1]);
    if s > m then
    begin
      m := s;
      mi := i;
    end;
  end;
  Result := '';
  for i := mi to mi + k - 1 do
    Result += strarr[i];
end;

end.
