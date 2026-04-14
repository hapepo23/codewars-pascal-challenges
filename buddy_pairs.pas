{
5 kyu
Buddy Pairs
https://www.codewars.com/kata/59ccf051dcc4050f7800008f
}

program buddy_pairs;

{$mode objfpc}{$H+}

uses
  buddy_pairs_unit,
  SysUtils;

type
  TBuddy = array [0..1] of int64;

  function ArrayToString(A: TBuddy): string;
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

  procedure DoTest(Expected: string; start, limit: int64);
  var
    Actual: string;
  begin
    Actual := ArrayToString(Buddy(start, limit));
    writeln('Start   : ', start);
    writeln('Limit   : ', limit);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('[48, 75]', 10, 50);
  DoTest('[-1, -1]', 200, 1000);
  DoTest('[62744, 75495]', 57345, 90061);
  DoTest('[-1, -1]', 2177, 4357);
  DoTest('[1081184, 1331967]', 1071625, 1103735);
end.
