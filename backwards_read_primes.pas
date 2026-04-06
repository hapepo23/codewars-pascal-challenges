{
6 kyu
Backwards Read Primes
https://www.codewars.com/kata/5539fecef69c483c5a000015
}

program backwards_read_primes;

{$mode objfpc}{$H+}

uses
  backwards_read_primes_unit,
  SysUtils;

type
  IntegerArray = array of int64;

  function ArrayToString(A: IntegerArray): string;
  var
    i: int64;
    res: string;
  begin
    res := '[';
    for i := 0 to High(A) do
      res += IntToStr(A[i]) + ', ';
    if (res = '[') then
      Result := '[]'
    else
      Result := Copy(res, 1, Length(res) - 2) + ']';
  end;

  procedure DoTest(start, nd: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := ArrayToString(BackwardsPrime(start, nd));
    writeln('Start   : ', start);
    writeln('End     : ', nd);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(7000, 7100,
    '[7027, 7043, 7057]');
  DoTest(70000, 70245,
    '[70001, 70009, 70061, 70079, 70121, 70141, 70163, 70241]');
  DoTest(70485, 70600,
    '[70489, 70529, 70573, 70589]');
  DoTest(60000, 70000,
    '[]');
end.
