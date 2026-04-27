{
5 kyu
Fibo akin
https://www.codewars.com/kata/5772382d509c65de7e000982
}

program fibo_akin;

{$mode objfpc}{$H+}

uses
  fibo_akin_unit;

  procedure DoTest1(n, k: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := LengthSupUK(n, k);
    writeln('Testing LengthSupUK(n, k)...');
    writeln('n       : ', n);
    writeln('k       : ', k);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

  procedure DoTest2(n: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := comp(n);
    writeln('Testing Comp(n)...');
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest1(50, 25, 2);
  DoTest1(3332, 973, 1391);
  DoTest1(2941, 862, 1246);
  DoTest2(74626, 37128);
  DoTest2(71749, 35692);
  DoTest2(56890, 28281);
end.
