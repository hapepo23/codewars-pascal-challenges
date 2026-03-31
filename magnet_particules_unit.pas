{
4 kyu
Magnet particules in boxes
https://www.codewars.com/kata/56c04261c3fcf33f2d000534
}

unit magnet_particules_unit;

{$mode objfpc}{$H+}

interface

function Doubles(maxk, maxn: int64): double;

implementation

uses
  Math;

function Doubles(maxk, maxn: int64): double;
var
  n, k: int64;
  base, kk, s: double;
begin
  Result := 0.0;
  for n := 1 to maxn do
  begin
    base := n + 1.0;
    for k := 1 to maxk do
    begin
      kk := k;
      s := 1.0 / (kk * Power(base, 2.0 * kk));
      Result += s;
      if s < 1e-20 then
        break;
    end;
  end;
end;

end.
