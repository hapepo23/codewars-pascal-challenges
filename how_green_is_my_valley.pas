{
7 kyu
How Green Is My Valley?
https://www.codewars.com/kata/56e3cd1d93c3d940e50006a4
}

program how_green_is_my_valley;

{$mode objfpc}{$H+}

uses
  how_green_is_my_valley_unit,
  SysUtils;

type
  TInt64Array = array of int64;

  function ArrayToString(A: TInt64Array): string;
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

  procedure DoTest(arr: TInt64Array; ExpectedStr: string);
  var
    Actual: TInt64Array;
    ActualStr: string;
  begin
    Actual := MakeValley(arr);
    ActualStr := ArrayToString(Actual);
    writeln('Array   : ', ArrayToString(arr));
    writeln('Expected: ', ExpectedStr);
    writeln('Actual  : ', ActualStr);
    if ExpectedStr = ActualStr then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest([17, 17, 15, 14, 8, 7, 7, 5, 4, 4, 1],
    '[17, 15, 8, 7, 4, 1, 4, 5, 7, 14, 17]');
  DoTest([20, 7, 6, 2],
    '[20, 6, 2, 7]');
  DoTest([14, 10, 8],
    '[14, 8, 10]');
  DoTest([20, 18, 17, 13, 12, 12, 10, 9, 4, 2, 2, 1, 1],
    '[20, 17, 12, 10, 4, 2, 1, 1, 2, 9, 12, 13, 18]');
end.
