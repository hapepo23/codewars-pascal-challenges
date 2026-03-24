{
5 kyu
Closest and Smallest
https://www.codewars.com/kata/5868b2de442e3fb2bb000119
}

program closest_and_smallest;

{$mode objfpc}{$H+}

uses
  SysUtils,
  closest_and_smallest_unit;

type
  TClosestSmallestArray = array of array[0..2] of int64;

  function Array2DToString(Arr: TClosestSmallestArray): string;
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

  procedure DoTest(strng: string; Expected: string);
  var
    Actual: TClosestSmallestArray;
    ActualString: string;
  begin
    Actual := Closest(strng);
    ActualString := Array2DToString(Actual);
    writeln('String of numbers: ', strng);
    writeln('Expected         : ', Expected);
    writeln('Actual           : ', ActualString);
    if Expected = ActualString then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('', '[]');
  DoTest('456899 50 11992 176 272293 163 389128 96 290193 85 52',
    '[(13 9 85)(14 3 176)]');
  DoTest('239382 162 254765 182 485944 134 468751 62 49780 108 54',
    '[(8 5 134)(8 7 62)]');
  DoTest('241259 154 155206 194 180502 147 300751 200 406683 37 57',
    '[(10 1 154)(10 9 37)]');
  DoTest('89998 187 126159 175 338292 89 39962 145 394230 167 1',
    '[(13 3 175)(14 9 167)]');
end.
