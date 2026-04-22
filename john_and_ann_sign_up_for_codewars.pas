{
5 kyu
John and Ann sign up for Codewars
https://www.codewars.com/kata/57591ef494aba64d14000526
}

program john_and_ann_sign_up_for_codewars;

{$mode objfpc}{$H+}

uses
  SysUtils,
  john_and_ann_sign_up_for_codewars_unit;

  function ArrayToString(A: IntegerArray): string;
  var
    i: int64;
  begin
    Result := '[';
    for i := 0 to High(A) do
      Result += IntToStr(A[i]) + ', ';
    Result := Copy(Result, 1, Length(Result) - 2) + ']';
  end;

  procedure DoTest1(n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := ArrayToString(John(n));
    writeln('John(n) ...');
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

  procedure DoTest2(n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := ArrayToString(Ann(n));
    writeln('Ann(n) ...');
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

  procedure DoTest3(n: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := SumJohn(n);
    writeln('SumJohn(n) ...');
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

  procedure DoTest4(n: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := SumAnn(n);
    writeln('SumAnn(n) ...');
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest1(20, '[0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6, 7, 7, 8, 9, 9, 10, 11, 11, 12]');
  DoTest1(11, '[0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6]');
  DoTest1(8, '[0, 0, 1, 2, 2, 3, 4, 4]');
  DoTest2(22, '[1, 1, 2, 2, 3, 3, 4, 5, 5, 6, 6, 7, 8, 8, 9, 9, 10, 11, 11, 12, 13, 13]');
  DoTest2(17, '[1, 1, 2, 2, 3, 3, 4, 5, 5, 6, 6, 7, 8, 8, 9, 9, 10]');
  DoTest3(91, 2537);
  DoTest3(65, 1289);
  DoTest4(95, 2776);
  DoTest4(148, 6746);
end.
