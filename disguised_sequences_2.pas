{
6 kyu
Disguised sequences (II)
https://www.codewars.com/kata/56fe17fcc25bf3e19a000292
}

program disguised_sequences_2;

{$mode objfpc}{$H+}

uses
  disguised_sequences_2_unit;

  procedure DoTest1(n, p: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := V1(n, p);
    writeln('V(n,p)...');
    writeln('n       : ', n);
    writeln('p       : ', p);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

  procedure DoTest2(n, p: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := U1(n, p);
    writeln('U(n,p)...');
    writeln('n       : ', n);
    writeln('p       : ', p);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  { V(n,p) }
  DoTest1(1, 12, 36);
  DoTest1(2, 138, 690);
  DoTest1(3, 69, 483);
  DoTest1(12, 70, 1750);
  DoTest1(1000, 10000, 20010000);
  { U(n,p) }
  DoTest2(1, 14, 28);
  DoTest2(4, 18, 90);
  DoTest2(5, 11, 66);
  DoTest2(13, 18, 252);
  DoTest2(1700, 20000, 34020000);
end.
