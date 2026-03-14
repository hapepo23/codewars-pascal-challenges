{
5 kyu
Best travel
https://www.codewars.com/kata/55e7280b40e1c4a06d0000aa
}

program best_travel;

{$mode objfpc}{$H+}

uses
  SysUtils,
  best_travel_unit;

type
  TInt64Array = array of int64;

var
  ts: TInt64Array;

  function ArrayToString(A: TInt64Array): string;
  var
    i: int64;
  begin
    Result := '[';
    for i := 0 to High(A) do
    begin
      Result += IntToStr(A[i]) + ', ';
    end;
    Result := Copy(Result, 1, Length(Result) - 2) + ']';
  end;

  procedure DoTest(t, k: int64; ls: TInt64Array; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := ChooseBestSum(t, k, ls);
    writeln('Max. Miles t  : ', t);
    writeln('Number Towns k: ', k);
    writeln('Distances ls  : (', Length(ls), ') = ', ArrayToString(ls));
    writeln('Expected      : ', Expected);
    writeln('Actual        : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  ts := [50, 55, 57, 58, 60];
  DoTest(174, 3, ts, 173);
  ts := [50, 55, 56, 57, 58];
  DoTest(163, 3, ts, 163);
  ts := [50];
  DoTest(163, 3, ts, -1);
  ts := [91, 74, 73, 85, 73, 81, 87];
  DoTest(230, 3, ts, 228);
  DoTest(331, 2, ts, 178);
  DoTest(331, 4, ts, 331);
  ts := [91, 74, 73, 85, 73, 81, 87];
  DoTest(331, 5, ts, -1);
end.
