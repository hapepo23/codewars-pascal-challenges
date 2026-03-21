{
4 kyu
Sum by Factors
https://www.codewars.com/kata/54d496788776e49e6b00052f
}

program sum_by_factors;

{$mode objfpc}{$H+}

uses
  SysUtils,
  sum_by_factors_unit;

type
  IntegerArray = array of integer;
  TArr2D = array of array of int64;

  function ArrayToString(A: IntegerArray): string;
  var
    i: int64;
  begin
    Result := '[';
    for i := 0 to High(A) do
    begin
      Result += IntToStr(A[i]) + ', ';
    end;
    Result := Copy(Result, 1, Length(Result) - 2) + ']';
  end;

  function Array2DToString(Arr: TArr2D): string;
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

  procedure DoTest(a: IntegerArray; Expected: string);
  var
    Actual: TArr2D;
    Astr: string;
  begin
    Actual := SumOfDivided(a);
    Astr := Array2DToString(Actual);
    writeln('Array   : ', ArrayToString(a));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Astr);
    if Expected = Astr then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest([15, 21, 24, 30, 45], '[(2 54)(3 135)(5 90)(7 21)]');
  DoTest([-29804, -4209, -28265, -72769, -31744],
    '[(2 -61548)(3 -4209)(5 -28265)(23 -4209)(31 -31744)(53 -72769)(61 -4209)(1373 -72769)(5653 -28265)(7451 -29804)]');
  DoTest([173471], '[(41 173471)(4231 173471)]');
  DoTest([611953, 1223906], '[(2 1223906)(611953 1835859)]');
  DoTest([611953, 1223906, 25090073], '[(2 1223906)(41 25090073)(611953 26925932)]');
end.
