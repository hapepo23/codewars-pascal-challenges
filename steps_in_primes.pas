{
6 kyu
Steps in Primes
https://www.codewars.com/kata/5613d06cee1e7da6d5000055
}

program steps_in_primes;

{$mode objfpc}{$H+}

uses
  steps_in_primes_unit,
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

  procedure DoTest(g, start, nd: int64; ExpectedStr: string);
  var
    Actual: IntegerArray;
    ActualStr: string;
  begin
    Actual := Step(g, start, nd);
    ActualStr := ArrayToString(Actual);
    writeln('Gap     : ', g);
    writeln('Start   : ', start);
    writeln('End     : ', nd);
    writeln('Expected: ', ExpectedStr);
    writeln('Actual  : ', ActualStr);
    if ExpectedStr = ActualStr then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(2, 100, 110, '[101, 103]');
  DoTest(6, 100, 110, '[101, 107]');
  DoTest(8, 300, 400, '[359, 367]');
  DoTest(10, 300, 400, '[307, 317]');
end.
