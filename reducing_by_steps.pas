{
6 kyu
Reducing by steps
https://www.codewars.com/kata/56efab15740d301ab40002ee
}

program reducing_by_steps;

{$mode objfpc}{$H+}

uses
  reducing_by_steps_unit,
  SysUtils;

type
  TInt64Array = array of int64;
  TFunctionParameter = function(x, y: int64): int64;

var
  a, r: TInt64Array;

  function ArrayToString(A: TInt64Array): string;
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

  procedure DoTest(fn: string; f: TFunctionParameter; arr: TInt64Array;
    init: int64; Expected: TInt64Array);
  var
    ExpectedStr, ActualStr: string;
    Actual: TInt64Array;
  begin
    ExpectedStr := ArrayToString(Expected);
    Actual := OperArray(f, arr, init);
    ActualStr := ArrayToString(Actual);
    writeln('Function: ', fn);
    writeln('Array   : ', ArrayToString(arr));
    writeln('Init    : ', init);
    writeln('Expected: ', ExpectedStr);
    writeln('Actual  : ', ActualStr);
    if ExpectedStr = ActualStr then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  a := [18, 69, -90, -78, 65, 40];
  r := [18, 3, 3, 3, 1, 1];
  DoTest('gcdi', @Gcdi, a, a[0], r);
  r := [18, 414, 2070, 26910, 26910, 107640];
  DoTest('lcmu', @Lcmu, a, a[0], r);
  r := [18, 87, -3, -81, -16, 24];
  DoTest('som', @Som, a, 0, r);
  r := [18, 18, -90, -90, -90, -90];
  DoTest('mini', @Mini, a, a[0], r);
  r := [18, 69, 69, 69, 69, 69];
  DoTest('maxi', @Maxi, a, a[0], r);
end.
