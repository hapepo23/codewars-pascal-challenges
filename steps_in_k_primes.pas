{
6 kyu
Steps in k-primes
https://www.codewars.com/kata/5a48948e145c46820b00002f
}

program steps_in_k_primes;

{$mode objfpc}{$H+}

uses
  SysUtils,
  steps_in_k_primes_unit;

type
  TStepArray = array of array[0..1] of int64;

  function Array2DToString(Arr: TStepArray): string;
  var
    i, j: int64;
  begin
    Result := '[';
    for i := Low(Arr) to High(Arr) do
    begin
      Result += '(';
      for j := Low(Arr[i]) to High(Arr[i]) do
        Result += IntToStr(Arr[i][j]) + ' ';
      Result := TrimRight(Result) + ')';
    end;
    Result := Copy(Result, 1, Length(Result)) + ']';
  end;

  procedure DoTest(k, step, start, nd: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := Array2DToString(KprimesStep(k, step, start, nd));
    writeln('k       : ', k);
    writeln('Step    : ', step);
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
  DoTest(5, 20, 0, 50, '[]');
  DoTest(7, 6, 204961, 205280, '[]');
  DoTest(2, 2, 0, 50, '[(4 6)(33 35)]');
  DoTest(6, 14, 2113665, 2113889, '[(2113722 2113736)]');
  DoTest(2, 10, 0, 50, '[(4 14)(15 25)(25 35)(39 49)]');
  DoTest(5, 9, 28285, 28605, '[(28530 28539)(28593 28602)]');
  DoTest(6, 8, 2627408, 2627504,
    '[(2627408 2627416)(2627440 2627448)(2627496 2627504)]');
  DoTest(5, 8, 255796, 256287,
    '[(255870 255878)(256008 256016)(256236 256244)(256270 256278)]');
  DoTest(6, 10, 217568, 218025, '[(217700 217710)(217740 217750)(217998 218008)]');
end.
