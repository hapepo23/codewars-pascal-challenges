{
6 kyu
Bonuses
https://www.codewars.com/kata/5d68d05e7a60ba002b0053f6
}

program bonuses;

{$mode objfpc}{$H+}

uses
  SysUtils,
  bonuses_unit;

type
  TI64Array = array of int64;

  function ArrayToString(A: TI64Array): string;
  var
    i: int64;
    res: string;
  begin
    res := '[';
    for i := 0 to High(A) do
    begin
      res += IntToStr(A[i]) + ', ';
    end;
    if (res = '[') then
      Result := '[]'
    else
      Result := Copy(res, 1, Length(res) - 2) + ']';
  end;

  procedure DoTest(arr: TI64Array; s: int64; ExpectedString: string);
  var
    Actual: TI64Array;
    ActualString: string;
  begin
    Actual := Bonus(arr, s);
    ActualString := ArrayToString(Actual);
    writeln('Days of absence: ', ArrayToString(arr));
    writeln('Total Bonus    : ', s);
    writeln('Expected       : ', ExpectedString);
    writeln('Actual         : ', ActualString);
    if ExpectedString = ActualString then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest([22, 3, 15], 18228, '[1860, 13640, 2728]');
  DoTest([8, 14, 11], 23541, '[10241, 5852, 7448]');
  DoTest([8, 20, 17], 25281, '[13515, 5406, 6360]');
  DoTest([6, 15, 23], 22156, '[13340, 5336, 3480]');
  DoTest([7, 9, 12], 10880, '[4608, 3584, 2688]');
  DoTest([12, 23, 10, 25, 18, 26, 13, 22, 21, 17], 2284754351,
    '[322897575, 168468300, 387477090, 154990836, 215265050, 149029650, 298059300, 176125950, 184512900, 227927700]');
end.
