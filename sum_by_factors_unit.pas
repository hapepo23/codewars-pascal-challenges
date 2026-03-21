{
4 kyu
Sum by Factors
https://www.codewars.com/kata/54d496788776e49e6b00052f
}

unit sum_by_factors_unit;

{$mode objfpc}{$H+}

interface

type
  IntegerArray = array of integer;
  TArr2D = array of array of int64;

function SumOfDivided(const a: IntegerArray): TArr2D;

implementation

type
  Tprec = record
    prime: int64;
    sum: int64;
  end;
  TprecArray = array of Tprec;

function UniquePrimeFactors(n: int64): IntegerArray;
var
  factors: IntegerArray;
  i: integer;
begin
  factors := IntegerArray.Create;
  SetLength(factors, 0);
  n := Abs(n);
  i := 2;
  while i * i <= n do
  begin
    if n mod i = 0 then
    begin
      SetLength(factors, Length(factors) + 1);
      factors[High(factors)] := i;
      while n mod i = 0 do
        n := n div i;
    end;
    Inc(i);
  end;
  if n > 1 then
  begin
    SetLength(factors, Length(factors) + 1);
    factors[High(factors)] := n;
  end;
  Result := factors;
end;

function SumOfDivided(const a: IntegerArray): TArr2D;
var
  primeSums: TprecArray;
  temp: Tprec;
  i, j, k: integer;
  factors: IntegerArray;
  found: boolean;
begin
  primeSums := TPrecArray.Create;
  SetLength(primeSums, 0);
  for i := 0 to High(a) do
  begin
    factors := UniquePrimeFactors(a[i]);
    for j := 0 to High(factors) do
    begin
      found := False;
      for k := 0 to High(primeSums) do
      begin
        if primeSums[k].prime = factors[j] then
        begin
          primeSums[k].sum := primeSums[k].sum + a[i];
          found := True;
          Break;
        end;
      end;
      if not found then
      begin
        SetLength(primeSums, Length(primeSums) + 1);
        primeSums[High(primeSums)].prime := factors[j];
        primeSums[High(primeSums)].sum := a[i];
      end;
    end;
  end;
  for i := 0 to High(primeSums) - 1 do
    for j := i + 1 to High(primeSums) do
      if primeSums[i].prime > primeSums[j].prime then
      begin
        temp := primeSums[i];
        primeSums[i] := primeSums[j];
        primeSums[j] := temp;
      end;
  Result := TArr2D.Create;
  SetLength(Result, Length(primeSums));
  for i := 0 to High(primeSums) do
  begin
    SetLength(Result[i], 2);
    Result[i][0] := primeSums[i].prime;
    Result[i][1] := primeSums[i].sum;
  end;
end;

end.
