{
6 kyu
Positions Average
https://www.codewars.com/kata/59f4a0acbee84576800000af
}

unit positions_average_unit;

{$mode objfpc}{$H+}

interface

function PosAverage(s: string): double;

implementation

uses
  SysUtils,
  Math;

function PosAverage(s: string): double;
var
  slist: array of string;
  lslist, lstr, i, j, k: integer;
  Count, total: int64;
begin
  slist := s.Split(',');
  lslist := Length(slist);
  lstr := MaxInt;
  for i := 0 to lslist - 1 do
  begin
    slist[i] := Trim(slist[i]);
    lstr := Min(lstr, Length(slist[i]));
  end;
  Count := 0;
  total := (lslist * (lslist - 1) div 2) * lstr;
  for i := 0 to lslist - 1 do
    for j := i + 1 to lslist - 1 do
      for k := 1 to lstr do
        if slist[i][k] = slist[j][k] then
          Count := Count + 1;
  Result := 100.0 * double(Count) / double(total);
end;

end.
