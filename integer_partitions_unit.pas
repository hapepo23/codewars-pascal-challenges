{
4 kyu
Getting along with Integer Partitions
https://www.codewars.com/kata/55cf3b567fc0e02b0b00000b
}

unit integer_partitions_unit;

{$mode objfpc}{$H+}

interface

function Part(n: int64): string;

implementation

uses
  SysUtils,
  Generics.Collections;

function Part(n: int64): string;
var
  p: array of int64;
  prod: array of int64;
  k, rem, val, j, prd, lprod: int64;
  found: boolean;
  med, avg: double;
begin
  { Summary of the algorithm...
  We store a partition in an array:
  p[0], p[1], ..., p[k-1]
  k = current length, always: p[0] ≥ p[1] ≥ ... ≥ p[k-1] and Sum(p) = n
  Each step transforms the current partition into the next one.
  Start with: p[0] = n and k = 1 
  Loop:
    Calculate product of current partition
    Check if product already exists, if not, add it to "prod"
    Modify partition slightly to get the next one:
    Step 1: Find what can be changed
      We scan from the right and remove all trailing 1s
      because [... , 1,1,1] cannot be reduced further at the end.
      So we: Count them into "rem", and shrink the partition
    Step 2: Reduce the pivot
      Take the rightmost number > 1 and decrease it
      This creates the “next smaller” partition structure.
    Step 3: Redistribute the remainder
      We rebuild the rest using the largest allowed values
      Constraint: new elements ≤ p[k-1]
      Why? To maintain non-increasing order and avoid duplicates.
  Repeat until done (all elements are 1 → stop)
  Sort "prod" array
  calculate range, average and median and store it in "result" }
  p := [];
  prod := [];
  lprod := 0;
  SetLength(p, n);
  p[0] := n;
  k := 1;
  while True do
  begin
    prd := 1;
    for j := 0 to k - 1 do
      prd *= p[j];
    found := False;
    for j := 0 to lprod - 1 do
      if prd = prod[j] then
      begin
        found := True;
        Break;
      end;
    if not found then
    begin
      Inc(lprod);
      SetLength(prod, lprod);
      prod[lprod - 1] := prd;
    end;
    rem := 0;
    while (k > 0) and (p[k - 1] = 1) do
    begin
      rem += p[k - 1];
      Dec(k);
    end;
    if k = 0 then
      Break;
    Dec(p[k - 1]);
    Inc(rem);
    val := p[k - 1];
    while rem > val do
    begin
      p[k] := val;
      rem -= val;
      Inc(k);
    end;
    p[k] := rem;
    Inc(k);
  end;
  specialize TArrayHelper<int64>.Sort(prod);
  avg := 0.0;
  for j := 0 to lprod - 1 do
    avg += prod[j];
  avg /= lprod;
  if lprod mod 2 = 1 then
    med := prod[(lprod - 1) div 2]
  else
    med := (prod[(lprod - 1) div 2] + prod[((lprod - 1)) div 2 + 1]) / 2.0;
  Result := 'Range: ' + IntToStr(prod[lprod - 1] - prod[0]) +
    ' Average: ' + Format('%f', [avg]) + ' Median: ' + Format('%f', [med]);
end;

end.
