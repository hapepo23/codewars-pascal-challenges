{
6 kyu
Are they the "same"?
https://www.codewars.com/kata/550498447451fbbd7600041c
}

unit same_arrays_unit;

{$mode objfpc}{$H+}

{ --- My solution --- }

interface

type
  IntegerArray = array of int64;

function comp(a, b: IntegerArray): boolean;

implementation

procedure QuickSort(var A: IntegerArray; Asc: boolean);

  procedure InsertionSort(L, R: int64);
  var
    i, j, key: int64;
  begin
    for i := L + 1 to R do
    begin
      key := A[i];
      j := i - 1;
      if Asc then
        while (j >= L) and (A[j] > key) do
        begin
          A[j + 1] := A[j];
          Dec(j);
        end
      else
        while (j >= L) and (A[j] < key) do
        begin
          A[j + 1] := A[j];
          Dec(j);
        end;
      A[j + 1] := key;
    end;
  end;

  procedure QSort(L, R: int64);
  var
    I, J, Pivot, Tmp: int64;
  begin
    while L < R do
    begin
      if (R - L) < 16 then
      begin
        InsertionSort(L, R);
        Exit;
      end;
      I := L;
      J := R;
      Pivot := A[L + (R - L) shr 1];
      repeat
        if Asc then
        begin
          while A[I] < Pivot do Inc(I);
          while A[J] > Pivot do Dec(J);
        end
        else
        begin
          while A[I] > Pivot do Inc(I);
          while A[J] < Pivot do Dec(J);
        end;
        if I <= J then
        begin
          Tmp := A[I];
          A[I] := A[J];
          A[J] := Tmp;
          Inc(I);
          Dec(J);
        end;
      until I > J;
      if (J - L) < (R - I) then
      begin
        if L < J then QSort(L, J);
        L := I;
      end
      else
      begin
        if I < R then QSort(I, R);
        R := J;
      end;
    end;
  end;

begin
  if Length(A) > 1 then
    QSort(Low(A), High(A));
end;

function comp(a, b: IntegerArray): boolean;
var
  i: int64;
begin
  if Length(a) <> Length(b) then
    Exit(False);
  if (Length(a) = 0) and (Length(b) = 0) then
    Exit(True);
  for i := Low(a) to High(a) do
    a[i] := Sqr(a[i]);
  QuickSort(a, True);
  QuickSort(b, True);
  for i := Low(a) to High(a) do
    if a[i] <> b[i] then
      Exit(False);
  Result := True;
end;

{ --- A much better solution ---

interface

function comp(a, b: array of int64): boolean;

implementation

uses
  Generics.Collections,
  SysUtils;

function comp(a, b: array of int64): boolean;
var
  i: int64;
begin
  if Length(a) <> Length(b) then
    Result := False
  else
  begin
    for i := Low(a) to High(a) do
      a[i] := Sqr(a[i]);
    specialize TArrayHelper<int64>.Sort(a);
    specialize TArrayHelper<int64>.Sort(b);
    Result := CompareMem(@a, @b, Length(a) * SizeOf(int64));
  end;
end;

------ }

end.
