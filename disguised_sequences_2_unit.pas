{
6 kyu
Disguised sequences (II)
https://www.codewars.com/kata/56fe17fcc25bf3e19a000292
}

unit disguised_sequences_2_unit;

{$mode objfpc}{$H+}

interface

function U1(n, p: int64): int64;
function V1(n, p: int64): int64;

implementation

function U1(n, p: int64): int64;
begin
  Result := (n + 1) * p;
end;

function V1(n, p: int64): int64;
begin
  Result := (2 * n + 1) * p;
end;

end.
