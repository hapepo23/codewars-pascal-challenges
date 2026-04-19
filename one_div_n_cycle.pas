{
6 kyu
1/n-Cycle
https://www.codewars.com/kata/5a057ec846d843c81a0000ad
}

program one_div_n_cycle;

{$mode objfpc}{$H+}

uses
  one_div_n_cycle_unit;

  procedure DoTest(n: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Cycle(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(3, 1);
  DoTest(33, 2);
  DoTest(18118, -1);
  DoTest(69, 22);
  DoTest(197, 98);
  DoTest(278625, -1);
  DoTest(195937, 40128);
  DoTest(97, 96);
end.
