{
5 kyu
Primes in numbers
https://www.codewars.com/kata/54d512e62a5e54c96200019e
}

program prime_factor_decomposition;

{$mode objfpc}{$H+}

uses
  prime_factor_decomposition_unit;

  procedure DoTest(n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := PrimeFactors(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(2, '(2)');
  DoTest(1 << 30, '(2**30)');
  DoTest(2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23,
    '(2)(3)(5)(7)(11)(13)(17)(19)(23)');
  DoTest(7775460, '(2**2)(3**3)(5)(7)(11**2)(17)');
  DoTest(7919, '(7919)');
  DoTest(17 * 17 * 93 * 677, '(3)(17**2)(31)(677)');
  DoTest(933555431, '(7537)(123863)');
  DoTest(342217392, '(2**4)(3)(11)(43)(15073)');
  DoTest(35791357, '(7)(5113051)');
  DoTest(782611830, '(2)(3**2)(5)(7**2)(11)(13)(17)(73)');
  DoTest(775878912, '(2**8)(3**4)(17)(31)(71)');
  DoTest(483499306, '(2)(41**2)(143813)');
end.
