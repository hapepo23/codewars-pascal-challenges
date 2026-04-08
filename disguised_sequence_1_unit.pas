{
6 kyu
A disguised sequence (I)
https://www.codewars.com/kata/563f0c54a22b9345bf000053
}

unit disguised_sequence_1_unit;

{$mode objfpc}{$H+}

interface

function Fcn(n: int64): int64;

implementation

uses
  Math;

function Fcn(n: int64): int64;
begin
  Result := Trunc(Power(2.0, n));
end;

end.
