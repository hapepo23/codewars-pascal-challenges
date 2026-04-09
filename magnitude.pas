{
6 kyu
Magnitude
https://www.codewars.com/kata/5cc70653658d6f002ab170b5
}

program magnitude;

{$mode objfpc}{$H+}

uses
  magnitude_unit,
  SysUtils;

type
  TIntArray = array of int64;

  function ArrayToString(A: TIntArray): string;
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

  procedure DoTest(z: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := ArrayToString(SqrModulus(z));
    writeln('Input   : ', z);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('cart 15 16 4 19 11 8 3 5 2 2 10 10', '[1, 1285, 8521]');
  DoTest('polar 2.3 3', '[-1, -1, 1]');
  DoTest('polar 2531 3261', '[1, 6405961, 9665410]');
  DoTest('polara 2 3', '[-1, -1, 1]');
  DoTest('cart 3 4', '[1, 25, 52]');
  DoTest('polar 2 3 2 3 2 3 4 5 6 "11"', '[-1, -1, 1]');
end.
