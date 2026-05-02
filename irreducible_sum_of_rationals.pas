{
6 kyu
Irreducible Sum of Rationals
https://www.codewars.com/kata/5517fcb0236c8826940003c9
}

program irreducible_sum_of_rationals;

{$mode objfpc}{$H+}

uses
  irreducible_sum_of_rationals_unit,
  SysUtils;

type
  TArr2D = array of array of int64;
  TNumDen = array [0..1] of int64;

  function ArrayToString(A: TNumDen): string;
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

  function Array2DToString(Arr: TArr2D): string;
  var
    i, j: int64;
  begin
    Result := '[';
    for i := Low(Arr) to High(Arr) do
    begin
      Result += '[';
      for j := Low(Arr[i]) to High(Arr[i]) do
        Result += IntToStr(Arr[i][j]) + ', ';
      Result := Result.TrimRight([',', ' ']) + ']';
    end;
    Result := Copy(Result, 1, Length(Result)) + ']';
  end;

  procedure DoTest(l: TArr2D; Expected: string);
  var
    Actual: string;
  begin
    Actual := ArrayToString(SumFracts(l));
    writeln('List of rationals: ', Array2DToString(l));
    writeln('Expected         : ', Expected);
    writeln('Actual           : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest([[1, 2], [1, 3], [1, 4]], '[13, 12]');
  DoTest([[1, 3], [5, 3]], '[2, 1]');
  DoTest([[1, 2], [2, 9], [3, 18], [4, 24], [6, 48]], '[85, 72]');
  DoTest([[1, 84], [1, 27055], [1, 1359351420]], '[50, 4187]');
  DoTest([], '[0, 1]');
end.
