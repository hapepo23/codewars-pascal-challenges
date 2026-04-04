{
6 kyu
How Much?
https://www.codewars.com/kata/55b4d87a3766d9873a0000d4
}

program how_much;

{$mode objfpc}{$H+}

uses
  how_much_unit;

  procedure DoTest(m, n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := Howmuch(m, n);
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
  DoTest(1, 100, '[[M: 37 B: 5 C: 4][M: 100 B: 14 C: 11]]');
  DoTest(0, 200, '[[M: 37 B: 5 C: 4][M: 100 B: 14 C: 11][M: 163 B: 23 C: 18]]');
  DoTest(1100, 1000, '[[M: 1045 B: 149 C: 116]]');
  DoTest(60246, 60201, '[[M: 60202 B: 8600 C: 6689]]');
end.
