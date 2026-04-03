{
7 kyu
A Rule of Divisibility by 7
https://www.codewars.com/kata/55e6f5e58f7817808e00002e
}

program divisibility_by_seven;

{$mode objfpc}{$H+}

uses
  SysUtils,
  divisibility_by_seven_unit;

type
  TSeven = array [0..1] of int64;

  function ArrayToString(A: TSeven): string;
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

  procedure DoTest(m: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := ArrayToString(Seven(m));
    writeln('m       : ', m);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(0, '[0, 0]');
  DoTest(99, '[99, 0]');
  DoTest(105, '[0, 1]');
  DoTest(112, '[7, 1]');
  DoTest(1021, '[10, 2]');
  DoTest(770784, '[63, 4]');
  DoTest(477557101, '[28, 7]');
  DoTest(477557102, '[47, 7]');
end.
