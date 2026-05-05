{
6 kyu
Sums of Parts
https://www.codewars.com/kata/5ce399e0047a45001c853c2b
}

unit sum_of_parts_unit;

{$mode objfpc}{$H+}

interface

type
  IntegerArray = array of int64;

function PartsSums(ls: IntegerArray): IntegerArray;

implementation

function PartsSums(ls: IntegerArray): IntegerArray;
var
  lls, ii, ir: integer;
  sum: int64;
begin
  lls := Length(ls);
  Result := [];
  SetLength(Result, lls + 1);
  sum := 0;
  ii := lls - 1;
  ir := lls;
  Result[ir] := 0;
  Dec(ir);
  while ii >= 0 do
  begin
    sum += ls[ii];
    Result[ir] := sum;
    Dec(ir);
    Dec(ii);
  end;
end;

end.
