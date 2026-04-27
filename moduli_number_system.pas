{
6 kyu
Moduli number system
https://www.codewars.com/kata/54db15b003e88a6a480000b9
}

program moduli_number_system;

{$mode objfpc}{$H+}

uses
  SysUtils,
  moduli_number_system_unit;

type
  TIntegerArray = array of int64;

  function ArrayToString(A: TIntegerArray): string;
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

  procedure DoTest(n: int64; sys: TIntegerArray; Expected: string);
  var
    Actual: string;
  begin
    Actual := FromNb2Str(n, sys);
    writeln('n       : ', n);
    writeln('sys     : ', ArrayToString(sys));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(779, [8, 7, 5, 3], '-3--2--4--2-');
  DoTest(15, [8, 6, 5], 'Not applicable');
  DoTest(3450, [17, 5, 3], 'Not applicable');
  DoTest(3450, [13, 11, 7, 5, 3, 2], '-5--7--6--0--0--0-');
end.
