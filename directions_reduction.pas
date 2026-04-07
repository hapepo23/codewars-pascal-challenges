{
5 kyu
Directions Reduction
https://www.codewars.com/kata/550f22f4d758534c1100025a
}

program directions_reduction;

{$mode objfpc}{$H+}

uses
  SysUtils,
  StrUtils,
  directions_reduction_unit;

  function ArrayToString(A: TStringArray): string;
  var
    i: int64;
    res: string;
  begin
    res := '[';
    for i := 0 to High(A) do
      res += A[i] + ', ';
    if (res = '[') then
      Result := '[]'
    else
      Result := Copy(res, 1, Length(res) - 2) + ']';
  end;

  procedure DoTest(plan: TStringArray; Expected: string);
  var
    Actual: string;
  begin
    Actual := ArrayToString(DirReduc(plan));
    writeln('Plan    : ', ArrayToString(plan));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(['NORTH', 'SOUTH', 'SOUTH', 'EAST', 'WEST', 'NORTH', 'WEST'],
    '[WEST]');
  DoTest(['EAST', 'EAST', 'WEST', 'NORTH', 'WEST', 'EAST', 'EAST',
    'SOUTH', 'NORTH', 'WEST'],
    '[EAST, NORTH]');
  DoTest(['NORTH', 'SOUTH', 'SOUTH', 'EAST', 'WEST', 'NORTH'],
    '[]');
  DoTest(['WEST', 'EAST', 'SOUTH', 'EAST', 'WEST', 'WEST'],
    '[SOUTH, WEST]');
end.
