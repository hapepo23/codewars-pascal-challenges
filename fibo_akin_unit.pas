{
5 kyu
Fibo akin
https://www.codewars.com/kata/5772382d509c65de7e000982
}

unit fibo_akin_unit;

{$mode objfpc}{$H+}

interface

function LengthSupUK(n, k: int64): int64;
function comp(n: int64): int64;

implementation

var
  seq: array of int64;

procedure CalcSeqUpTo(n: int64);
var
  last, i: int64;
begin
  last := High(seq);
  if last < n then
  begin
    SetLength(seq, n + 1);
    for i := last + 1 to n do
      seq[i] := seq[i - seq[i - 1]] + seq[i - seq[i - 2]];
  end;
end;

function LengthSupUK(n, k: int64): int64;
var
  i: int64;
begin
  CalcSeqUpTo(n);
  Result := 0;
  for i := 1 to n do
    if seq[i] >= k then
      Inc(Result);
end;

function comp(n: int64): int64;
var
  i: int64;
begin
  CalcSeqUpTo(n);
  Result := 0;
  for i := 2 to n do
    if seq[i] < seq[i - 1] then
      Inc(Result);
end;

initialization

  begin
    seq := [];
    SetLength(seq, 3);
    seq[0] := 0;
    seq[1] := 1;
    seq[2] := 1;
  end;

end.
