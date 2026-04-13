{
6 kyu
Banker's Plan
https://www.codewars.com/kata/56445c4755d0e45b8c00010a
}

program bankers_plan;

{$mode objfpc}{$H+}

uses
  bankers_plan_unit,
  SysUtils;

  procedure DoTest(f0: int64; p: double; c0: int64; n: int64; i: double;
    Expected: boolean);
  var
    Actual: boolean;
  begin
    Actual := Fortune(f0, p, c0, n, i);
    writeln('f0      : ', f0);
    writeln('p       : ', Format('%.2g', [p]));
    writeln('c0      : ', c0);
    writeln('n       : ', n);
    writeln('i       : ', Format('%.2g', [i]));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(100000, 1.0, 2000, 15, 1.0, True);
  DoTest(100000, 1.0, 9185, 12, 1.0, False);
  DoTest(100000000, 1.0, 100000, 50, 1.0, True);
end.
