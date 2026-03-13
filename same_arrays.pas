{
6 kyu
Are they the "same"?
https://www.codewars.com/kata/550498447451fbbd7600041c
}

program same_arrays;

{$mode objfpc}{$H+}

uses
  SysUtils,
  same_arrays_unit;

type
  IntegerArray = array of int64;

var
  a1, a2: IntegerArray;

  function ArrayToString(A: IntegerArray): string;
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

  procedure DoTest(a, b: IntegerArray; Expected: boolean);
  var
    Actual: boolean;
  begin
    writeln('a       : ', ArrayToString(a));
    writeln('b       : ', ArrayToString(b));
    writeln('Expected: ', Expected);
    Actual := comp(a, b);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  a1 := [121, 144, 19, 161, 19, 144, 19, 11];
  a2 := [121, 14641, 20736, 361, 25921, 361, 20736, 361];
  DoTest(a1, a2, True);
  a1 := [121, 144, 19, 161, 19, 144, 19, 11];
  a2 := [11 * 21, 121 * 121, 144 * 144, 19 * 19, 161 * 161, 19 * 19, 144 * 144, 19 * 19];
  DoTest(a1, a2, False);
  a1 := [];
  a2 := [];
  DoTest(a1, a2, True);
  a1 := [];
  a2 := [1];
  DoTest(a1, a2, False);
end.
