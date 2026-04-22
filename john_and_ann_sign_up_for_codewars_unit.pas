{
5 kyu
John and Ann sign up for Codewars
https://www.codewars.com/kata/57591ef494aba64d14000526
}

unit john_and_ann_sign_up_for_codewars_unit;

{$mode objfpc}{$H+}

interface

type
  IntegerArray = array of integer;

function John(n: int64): IntegerArray;
function Ann(n: int64): IntegerArray;
function SumJohn(n: int64): int64;
function SumAnn(n: int64): int64;

implementation

function John(n: int64): IntegerArray;
var
  ann: IntegerArray;
  i: int64;
begin
  SetLength(ann, n);
  SetLength(Result, n);
  ann[0] := 1;
  Result[0] := 0;
  for i := 1 to n - 1 do
  begin
    ann[i] := i - Result[ann[i - 1]];
    Result[i] := i - ann[Result[i - 1]];
  end;
end;

function Ann(n: int64): IntegerArray;
var
  john: IntegerArray;
  i: int64;
begin
  SetLength(Result, n);
  SetLength(john, n);
  Result[0] := 1;
  john[0] := 0;
  for i := 1 to n - 1 do
  begin
    Result[i] := i - john[Result[i - 1]];
    john[i] := i - Result[john[i - 1]];
  end;
end;

function SumJohn(n: int64): int64;
var
  ann, john: IntegerArray;
  i: int64;
begin
  SetLength(ann, n);
  SetLength(john, n);
  ann[0] := 1;
  john[0] := 0;
  Result := john[0];
  for i := 1 to n - 1 do
  begin
    ann[i] := i - john[ann[i - 1]];
    john[i] := i - ann[john[i - 1]];
    Result += john[i];
  end;
end;

function SumAnn(n: int64): int64;
var
  ann, john: IntegerArray;
  i: int64;
begin
  SetLength(ann, n);
  SetLength(john, n);
  ann[0] := 1;
  john[0] := 0;
  Result := ann[0];
  for i := 1 to n - 1 do
  begin
    ann[i] := i - john[ann[i - 1]];
    john[i] := i - ann[john[i - 1]];
    Result += ann[i];
  end;
end;

end.
