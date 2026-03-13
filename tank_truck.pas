{
6 kyu
Tank Truck
https://www.codewars.com/kata/55f3da49e83ca1ddae0000ad
}

program tank_truck;

{$mode objfpc}{$H+}

uses
  tank_truck_unit;

  procedure DoTest(h, d, vt: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Tankvol(h, d, vt);
    writeln('h       : ', h);
    writeln('d       : ', d);
    writeln('vt      : ', vt);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(40, 120, 3500, 1021);
  DoTest(60, 120, 3500, 1750);
  DoTest(80, 120, 3500, 2478);
  DoTest(5, 7, 3848, 2940);
  DoTest(2, 7, 3848, 907);
  DoTest(2, 8, 5026, 982);
  DoTest(4, 9, 6361, 2731);
end.
