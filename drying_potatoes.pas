{
7 kyu
Drying Potatoes
https://www.codewars.com/kata/58ce8725c835848ad6000007
}

program drying_potatoes;

{$mode objfpc}{$H+}

uses
  drying_potatoes_unit;

  procedure DoTest(p0, w0, p1: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Potatoes(p0, w0, p1);
    writeln('p0      : ', p0);
    writeln('w0      : ', w0);
    writeln('p1      : ', p1);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(99, 100, 98, 50);
  DoTest(82, 127, 80, 114);
  DoTest(93, 129, 91, 100);
  DoTest(82, 134, 77, 104);
  DoTest(90, 194, 87, 149);
end.
