{
6 kyu
Tortoise racing
https://www.codewars.com/kata/55e2adece53b4cdcb900006c
}

program tortoise_racing;

{$mode objfpc}{$H+}

uses
  tortoise_racing_unit,
  SysUtils;

type
  TDuration = array [0..2] of int64;

  function ArrayToString(A: TDuration): string;
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

  procedure DoTest(v1, v2, g: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := ArrayToString(Race(v1, v2, g));
    writeln('v1, v2, g: [', v1, ', ', v2, ', ', g, ']');
    writeln('Expected : ', Expected);
    writeln('Actual   : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(80, 91, 37, '[3, 21, 49]');
  DoTest(720, 850, 70, '[0, 32, 18]');
  DoTest(820, 81, 550, '[-1, -1, -1]');
  DoTest(820, 850, 550, '[18, 20, 0]');
  DoTest(80, 100, 40, '[2, 0, 0]');
  DoTest(104, 140, 136, '[3, 46, 40]');
end.
