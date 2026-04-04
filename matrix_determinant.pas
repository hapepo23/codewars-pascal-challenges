{
4 kyu
Matrix Determinant
https://www.codewars.com/kata/52a382ee44408cea2500074c
}

program matrix_determinant;

{$mode objfpc}{$H+}

uses
  matrix_determinant_unit,
  SysUtils;

type
  TInt64Matrix = array of array of int64;

var
  matrix: TInt64Matrix;

  function MatrixToString(matrix: TInt64Matrix): string;
  var
    i, j: int64;
    res: string;
  begin
    Result := '[';
    for i := 0 to High(matrix) do
    begin
      if Result <> '[' then
        Result += ',' + LineEnding + ' ';
      res := '[';
      for j := 0 to High(matrix[i]) do
      begin
        if res <> '[' then
          res += ', ';
        res += IntToStr(matrix[i][j]);
      end;
      Result += res + ']';
    end;
    Result += ']';
  end;

  procedure DoTest(matrix: TInt64Matrix; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Determinant(matrix);
    writeln('Matrix: ', LineEnding, MatrixToString(matrix));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  matrix := [[5]];
  DoTest(matrix, 5);
  matrix := [[4, 6], [3, 8]];
  DoTest(matrix, 14);
  matrix := [[2, 4, 2], [3, 1, 1], [1, 2, 0]];
  DoTest(matrix, 10);
  matrix := [[2, 3, 7, 1], [7, 1, 9, 8], [8, 6, 1, 4], [0, 1, 4, 2]];
  DoTest(matrix, 681);
  matrix := [[1, 2, 5, -7, 5, 3], [7, -4, 6, 3, 9, 11], [22, -16, 4, 7, 8, 1],
    [-8, 0, 9, 5, 8, 1], [77, -6, -5, 1, 23, 3], [9, 6, -7, 3, 4, 5]];
  DoTest(matrix, -3487464);
  matrix := [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [-1, 4, 8, -9, 3, 2, 6, -8, 1, 2],
    [4, -2, 6, 3, 4, 3, 2, 4, 3, 1], [3, 1, -3, -2, 2, 1, -3, 1, 4, 3], [4, 4, 6, -4, -2, 4, -7, -3, 3, -4],
    [1, 2, 3, 1, -5, 0, 2, 4, 0, -3], [5, 6, 4, 2, 1, -6, -5, 3, 6, -3], [7, 2, 2, -1, 4, 1, -7, 0, 3, -6],
    [2, 2, -1, 4, 2, 2, 1, -8, 6, 3], [0, 2, 1, 2, 0, 2, 4, 2, -9, 2]];
  DoTest(matrix, -2605071686);
end.
