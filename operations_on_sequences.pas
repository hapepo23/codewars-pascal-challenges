{
5 kyu
Operations on sequences
https://www.codewars.com/kata/5e4bb05b698ef0001e3344bc
}

program operations_on_sequences;

{$mode objfpc}{$H+}

uses
  operations_on_sequences_unit,
  SysUtils;

type
  TArr = array of int64;
  T2Arr = array[0..1] of int64;

var
  a1: TArr;

  function ArrayToString(A: TArr): string;
  var
    i: int64;
    res: string;
  begin
    res := '[';
    for i := 0 to High(A) do
      res += IntToStr(A[i]) + ', ';
    if (res = '[') then
      Result := '[]'
    else
      Result := Copy(res, 1, Length(res) - 2) + ']';
  end;

  procedure DoTest(arr: TArr; exp1, exp2: int64);
  var
    Actual: T2Arr;
  begin
    Actual := Solve(arr);
    writeln('Array   : ', ArrayToString(arr));
    writeln('Expected: ', exp1, ', ', exp2);
    writeln('Actual  : ', Actual[0], ', ', Actual[1]);
    if (exp1 = Actual[0]) and (exp2 = Actual[1]) then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  a1 := [0, 7, 0, 0];
  DoTest(a1, 0, 0);
  a1 := [2, 1, 3, 4];
  DoTest(a1, 2, 11);
  a1 := [1, 3, 1, 2, 1, 5, 1, 9];
  DoTest(a1, 250, 210);
  a1 := [3, 9, 8, 4, 6, 8, 7, 8, 4, 8, 5, 6, 6, 4, 4, 5];
  DoTest(a1, 13243200, 25905600);
  a1 := [4, 3, 4, 2, 4, 5, 5, 9];
  DoTest(a1, 870, 1190);
end.
