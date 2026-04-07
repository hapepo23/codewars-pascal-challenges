{
5 kyu
Gap in Primes
https://www.codewars.com/kata/561e9c843a2ef5a40c0000a4
}

program gap_in_primes;

{$mode objfpc}{$H+}

uses
  gap_in_primes_unit,
  SysUtils;

type
  TGap = array [0..1] of int64;

  function ArrayToString(A: TGap): string;
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

  procedure DoTest(g, m, n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := ArrayToString(Gap(g, m, n));
    writeln('Gap     : ', g);
    writeln('Start   : ', m);
    writeln('End     : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(2, 103, 103, '[0, 0]');
  DoTest(2, 100, 104, '[101, 103]');
  DoTest(2, 100, 110, '[101, 103]');
  DoTest(4, 100, 110, '[103, 107]');
  DoTest(6, 100, 110, '[0, 0]');
  DoTest(8, 300, 400, '[359, 367]');
  DoTest(4, 100, 104, '[0, 0]');
  DoTest(2, 101, 103, '[101, 103]');
  DoTest(10, 300, 400, '[337, 347]');
end.
