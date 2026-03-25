{
6 kyu
Reducing by steps
https://www.codewars.com/kata/56efab15740d301ab40002ee
}

unit reducing_by_steps_unit;

{$mode objfpc}{$H+}

interface

type
  TInt64Array = array of int64;
  TFunctionParameter = function(x, y: int64): int64;

function Gcdi(a, b: int64): int64;
function Lcmu(a, b: int64): int64;
function Som(a, b: int64): int64;
function Maxi(a, b: int64): int64;
function Mini(a, b: int64): int64;
function OperArray(fct: TFunctionParameter; arr: TInt64Array; init: int64): TInt64Array;

implementation

function Gcdi(a, b: int64): int64;
var
  temp, absa, absb: int64;
begin
  absa := Abs(a);
  absb := Abs(b);
  while absb <> 0 do
  begin
    temp := absb;
    absb := absa mod absb;
    absa := temp;
  end;
  Result := absa;
end;

function Lcmu(a, b: int64): int64;
begin
  Result := Abs(b) * (Abs(a) div Gcdi(a, b));
end;

function Som(a, b: int64): int64;
begin
  Result := a + b;
end;

function Maxi(a, b: int64): int64;
begin
  if a > b then
    Result := a
  else
    Result := b;
end;

function Mini(a, b: int64): int64;
begin
  if a < b then
    Result := a
  else
    Result := b;
end;

function OperArray(fct: TFunctionParameter; arr: TInt64Array; init: int64): TInt64Array;
var
  i, l: int64;
begin
  l := Length(arr);
  Result := nil;
  SetLength(Result, l);
  Result[0] := fct(init, arr[0]);
  for i := 1 to l - 1 do
    Result[i] := fct(Result[i - 1], arr[i]);
end;

end.
