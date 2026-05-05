{
5 kyu
Common Denominators
https://www.codewars.com/kata/54d7660d2daf68c619000d95
}

program common_denominators;

{$mode objfpc}{$H+}

uses
  common_denominators_unit,
  SysUtils;

type
  TArr2D = array of array of int64;

  function Array2DToString(Arr: TArr2D): string;
  var
    i, j: int64;
  begin
    Result := '[';
    for i := Low(Arr) to High(Arr) do
    begin
      Result += '[';
      for j := Low(Arr[i]) to High(Arr[i]) do
        Result += IntToStr(Arr[i][j]) + ',';
      Result := Result.TrimRight([',']) + ']';
    end;
    Result := Copy(Result, 1, Length(Result)) + ']';
  end;

  procedure DoTest(ls: TArr2D; Expected: string);
  var
    Actual: string;
  begin
    Actual := Array2DToString(ConvertFrac(ls));
    writeln('Rat. ls : ', Array2DToString(ls));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest([[1, 2], [1, 3], [1, 4]], '[[6,12][4,12][3,12]]');
  DoTest([[2, 4], [2, 6], [3, 12]], '[[6,12][4,12][3,12]]');
  DoTest([[69, 130], [87, 1310], [3, 4]], '[[18078,34060][2262,34060][25545,34060]]');
  DoTest([[77, 130], [84, 131], [3, 4]], '[[20174,34060][21840,34060][25545,34060]]');
  DoTest([[27115, 5262], [87546, 11111111]],
    '[[301277774765,58466666082][460667052,58466666082]]');

end.
