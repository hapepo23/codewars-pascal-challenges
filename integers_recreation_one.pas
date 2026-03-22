{
5 kyu
Integers: Recreation One
https://www.codewars.com/kata/55aa075506463dac6600010d
}

program integers_recreation_one;

{$mode objfpc}{$H+}

uses
  integers_recreation_one_unit;

  procedure DoTest(m, n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := ListSquared(m, n);
    writeln('m       : ', m);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 250, '[[1, 1], [42, 2500], [246, 84100]]');
  DoTest(300, 600, '[]');
  DoTest(42, 250, '[[42, 2500], [246, 84100]]');
  DoTest(250, 500, '[[287, 84100]]');
end.
