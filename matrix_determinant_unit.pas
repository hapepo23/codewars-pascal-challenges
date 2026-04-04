{
4 kyu
Matrix Determinant
https://www.codewars.com/kata/52a382ee44408cea2500074c
}

unit matrix_determinant_unit;

{$mode objfpc}{$H+}

interface

type
  TInt64Matrix = array of array of int64;

function Determinant(matrix: TInt64Matrix): int64;

implementation

function CreateSubMatrix(matrix: TInt64Matrix; col: int64): TInt64Matrix;
var
  size, r, c: int64;
begin
  size := Length(matrix);
  Result := nil;
  SetLength(Result, size - 1, size - 1);
  for r := 1 to size - 1 do
  begin
    for c := 0 to col - 1 do
      Result[r - 1][c] := matrix[r][c];
    for c := col + 1 to size - 1 do
      Result[r - 1][c - 1] := matrix[r][c];
  end;
end;

function Determinant(matrix: TInt64Matrix): int64;
var
  size, i, k, cofactor: int64;
  sub_matrix: TInt64Matrix;
begin
  Result := 0;
  size := Length(matrix);
  if size = 1 then
    Result := matrix[0][0]
  else if size = 2 then
    Result := matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]
  else if size > 2 then
  begin
    for i := 0 to size - 1 do
    begin
      sub_matrix := CreateSubMatrix(matrix, i);
      if i mod 2 = 0 then
        k := 1
      else
        k := -1;
      cofactor := k * matrix[0][i] * Determinant(sub_matrix);
      Result += cofactor;
      sub_matrix := nil;
    end;
  end;
end;

end.
