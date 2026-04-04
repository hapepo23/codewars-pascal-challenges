{
7 kyu
Waiting room
https://www.codewars.com/kata/542f0c36d002f8cd8a0005e5
}

program waiting_room;

{$mode objfpc}{$H+}

uses
  waiting_room_unit;

  procedure DoTest(const N: integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := LastChair(N);
    writeln('Chairs N: ', N);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(3, 2);
  DoTest(10, 9);
end.
