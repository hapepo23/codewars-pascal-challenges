{
6 kyu
A disguised sequence (I)
https://www.codewars.com/kata/563f0c54a22b9345bf000053
}

program disguised_sequence_1;

{$mode objfpc}{$H+}

uses
  disguised_sequence_1_unit;

  procedure DoTest(n: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Fcn(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(10, 1024);
  DoTest(17, 131072);
  DoTest(21, 2097152);
  DoTest(43, 8796093022208);
  DoTest(62, 4611686018427387904);
end.
