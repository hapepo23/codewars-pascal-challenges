{
6 kyu
Cuckoo Clock
https://www.codewars.com/kata/656e4602ee72af0017e37e82
}

program cuckoo_clock;

{$mode objfpc}{$H+}

uses
  cuckoo_clock_unit;

  procedure DoTest(Expected: string; initial_time: string; target: integer);
  var
    Actual: string;
  begin
    Actual := CuckooClock(initial_time, target);
    writeln('Initial Time : ', initial_time);
    writeln('Number Chimes: ', target);
    writeln('Expected     : ', Expected);
    writeln('Actual       : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('07:30', '07:22', 1);
  DoTest('12:45', '12:22', 2);
  DoTest('01:45', '01:30', 2);
  DoTest('05:30', '04:01', 10);
  DoTest('06:00', '03:38', 19);
  DoTest('10:00', '10:00', 1);
  DoTest('10:00', '10:00', 10);
  DoTest('10:15', '10:00', 11);
  DoTest('10:45', '10:00', 13);
  DoTest('11:00', '10:00', 20);
  DoTest('12:30', '12:30', 1);
  DoTest('12:45', '12:30', 2);
  DoTest('01:00', '12:30', 3);
  DoTest('01:15', '12:30', 4);
  DoTest('02:30', '09:53', 50);
  DoTest('08:00', '08:17', 113);
  DoTest('08:15', '08:17', 114);
  DoTest('08:30', '08:17', 115);
  DoTest('11:00', '08:17', 150);
  DoTest('05:45', '08:17', 200);
end.
