{
6 kyu
The Walker
https://www.codewars.com/kata/5b40b666dfb4291ad9000049
}

program the_walker;

{$mode objfpc}{$H+}

uses
  the_walker_unit,
  SysUtils,
  Math;

type
  TWalker = array [0..3] of int64;

  function ArrayToString(A: TWalker): string;
  var
    i: int64;
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

  procedure DoTest(a, b, c, alpha, beta, gamma: int64; expected: string);
  var
    actual: TWalker;
  begin
    actual := solve(a, b, c, alpha, beta, gamma);
    writeln('a       : ', a);
    writeln('b       : ', b);
    writeln('c       : ', c);
    writeln('alpha   : ', alpha);
    writeln('beta    : ', beta);
    writeln('gamma   : ', gamma);
    writeln('Expected: ', expected);
    writeln('Actual  : ', ArrayToString(actual));
    if expected = ArrayToString(actual) then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(12, 20, 18, 45, 30, 60, '[15, 135, 49, 18]');
  DoTest(14, 25, 17, 41, 35, 59, '[20, 129, 41, 57]');
  DoTest(15, 15, 19, 50, 29, 55, '[12, 133, 18, 44]');
end.
