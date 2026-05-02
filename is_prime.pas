{
6 kyu
Is a number prime?
https://www.codewars.com/kata/5262119038c0985a5b00029f
}

program is_prime;

{$mode objfpc}{$H+}

uses
  is_prime_unit;

  procedure DoTest(n: integer; Expected: boolean);
  var
    Actual: boolean;
  begin
    Actual := IsPrime(n);
    writeln('Number n: ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(0, False);
  DoTest(1, False);
  DoTest(2, True);
  DoTest(73, True);
  DoTest(75, False);
  DoTest(-1, False);
  DoTest(3, True);
  DoTest(5, True);
  DoTest(7, True);
  DoTest(41, True);
  DoTest(5099, True);
  DoTest(4, False);
  DoTest(6, False);
  DoTest(8, False);
  DoTest(9, False);
  DoTest(45, False);
  DoTest(-5, False);
  DoTest(-8, False);
  DoTest(-41, False);
  DoTest(247464361, False);
  DoTest(1634300119, True);
end.
