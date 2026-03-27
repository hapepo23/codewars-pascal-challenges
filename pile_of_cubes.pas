{
6 kyu
Build a pile of Cubes
https://www.codewars.com/kata/5592e3bd57b64d00f3000047
}

program pile_of_cubes;

{$mode objfpc}{$H+}

uses
  pile_of_cubes_unit;

  procedure DoTest(m, Expected: int64);
  var
    Actual: int64;
  begin
    Actual := FindNb(m);
    writeln('m       : ', m);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 1);
  DoTest(8, -1);
  DoTest(9, 2);
  DoTest(10, -1);
  DoTest(131443152397956, 4788);
  DoTest(24723578342962, -1);
  DoTest(135440716410000, 4824);
end.
