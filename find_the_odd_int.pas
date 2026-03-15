{
6 kyu
Find the odd int
https://www.codewars.com/kata/54da5a58ea159efa38000836
}

program find_the_odd_int;

{$mode objfpc}{$H+}

uses
  SysUtils,
  find_the_odd_int_unit;

  function ArrayToString(A: array of integer): string;
  var
    i: integer;
    res: string;
  begin
    res := '[';
    for i := 0 to High(A) do
    begin
      res += IntToStr(A[i]) + ', ';
    end;
    if (res = '[') then
      Result := '[]'
    else
      Result := Copy(res, 1, Length(res) - 2) + ']';
  end;

  procedure DoTest(arr: array of integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := FindOdd(arr);
    writeln('Array   : ', ArrayToString(arr));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest([20, 1, -1, 2, -2, 3, 3, 5, 5, 1, 2, 4, 20, 4, -1, -2, 5], 5);
  DoTest([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5], -1);
  DoTest([20, 1, 1, 2, 2, 3, 3, 5, 5, 4, 20, 4, 5], 5);
  DoTest([10], 10);
  DoTest([1, 1, 1, 1, 1, 1, 10, 1, 1, 1, 1], 10);
  DoTest([5, 4, 3, 2, 1, 5, 4, 3, 2, 10, 10], 1);
end.
