{
5 kyu
Find the smallest
https://www.codewars.com/kata/573992c724fc289553000e95
}

program find_the_smallest;

{$mode objfpc}{$H+}

uses
  find_the_smallest_unit,
  SysUtils;

type
  TSmallest = array [0..2] of int64;

  function ArrayToString(A: TSmallest): string;
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

  procedure DoTest(n: int64; ExpectedStr: string);
  var
    Actual: TSmallest;
    ActualStr: string;
  begin
    Actual := Smallest(n);
    ActualStr := ArrayToString(Actual);
    writeln('n       : ', n);
    writeln('Expected: ', ExpectedStr);
    writeln('Actual  : ', ActualStr);
    if ExpectedStr = ActualStr then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(261235, '[126235, 2, 0]');
  DoTest(22, '[22, 0, 0]');
  DoTest(209917, '[29917, 0, 1]');
  DoTest(285365, '[238565, 3, 1]');
  DoTest(269045, '[26945, 3, 0]');
  DoTest(296837, '[239687, 4, 1]');
  DoTest(1000000, '[1, 0, 6]');
  DoTest(345657, '[345567, 3, 4]');
  DoTest(96682790625023136, '[9668279062523136, 11, 0]');
end.
