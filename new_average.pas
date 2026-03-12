{
7 kyu
Looking for a benefactor
https://www.codewars.com/kata/569b5cec755dd3534d00000f
}

program new_average;

{$mode objfpc}{$H+}

uses
  new_average_unit,
  SysUtils;

var
  arr: TDoubleArray;

  function ArrayToString(A: TDoubleArray): string;
  var
    i: int64;
    res: string;
  begin
    res := '[';
    for i := Low(A) to High(A) do
    begin
      res += Trim(Format('%.8g', [A[i]])) + ', ';
    end;
    if (res = '[') then
      Result := '[]'
    else
      Result := Copy(res, 1, Length(res) - 2) + ']';
  end;

  procedure DoTest(arr: TDoubleArray; navg: double; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := NewAvg(arr, navg);
    writeln('Array      : ', ArrayToString(arr));
    writeln('New Average: ', Trim(Format('%.8g', [navg])));
    writeln('Expected   : ', Expected);
    writeln('Actual     : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  arr := [14.0, 30.0, 5.0, 7.0, 9.0, 11.0, 16.0];
  DoTest(arr, 90, 628);
  arr := [14, 30, 5, 7, 9, 11, 15];
  DoTest(arr, 92, 645);
  arr := [1400.25, 30000.76, 5.56, 7, 9, 11, 15.48, 120.98];
  DoTest(arr, 10000, 58430);
  arr := [];
  DoTest(arr, 90, 90);
  arr := [14, 30, 5, 7, 9, 11, 15];
  DoTest(arr, 2, -1);
end.
