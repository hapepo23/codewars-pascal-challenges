{
5 kyu
Integers: Recreation One
https://www.codewars.com/kata/55aa075506463dac6600010d
}

unit integers_recreation_one_unit;

{$mode objfpc}{$H+}

interface

function ListSquared(m, n: int64): string;

implementation

uses
  SysUtils,
  Math;

function ListSquared(m, n: int64): string;
var
  i, j, k, limit, sum: int64;
  First: boolean = True;
begin
  Result := '[';
  for i := m to n do
  begin
    limit := Trunc(Sqrt(i));
    sum := 0;
    for j := 1 to limit do
    begin
      if i mod j = 0 then
      begin
        sum := sum + Sqr(j);
        k := i div j;
        if j <> k then
          sum := sum + Sqr(k);
      end;
    end;
    k := Trunc(Sqrt(sum));
    if k * k = sum then
    begin
      if First then
        First := False
      else
        Result := Result + ', ';
      Result := Result + '[' + IntToStr(i) + ', ' + IntToStr(sum) + ']';
    end;
  end;
  Result := Result + ']';
end;

end.

