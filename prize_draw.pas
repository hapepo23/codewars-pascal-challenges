{
6 kyu
Prize Draw
https://www.codewars.com/kata/5616868c81a0f281e500005c
}

program prize_draw;

{$mode objfpc}{$H+}

uses
  SysUtils,
  prize_draw_unit;

type
  TIntArray = array of int64;

  function ArrayToString(A: TIntArray): string;
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

  procedure DoTest(s: string; we: TIntArray; n: int64; expected: string);
  var
    actual: string;
  begin
    actual := Rank(s, we, n);
    writeln('Names s  : "', s, '"');
    writeln('Weights w: ', ArrayToString(we));
    writeln('Rank n   : ', n);
    writeln('Expected : ', expected);
    writeln('Actual   : ', actual);
    if expected = actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('Addison,Jayden,Sofia,Michael,Andrew,Lily,Benjamin',
    [4, 2, 1, 4, 3, 1, 2], 4, 'Benjamin');
  DoTest('Elijah,Chloe,Elizabeth,Matthew,Natalie,Jayden', [1, 3, 5, 5, 3, 6],
    2, 'Matthew');
  DoTest('Aubrey,Olivai,Abigail,Chloe,Andrew,Elizabeth', [3, 1, 4, 4, 3, 2],
    4, 'Abigail');
  DoTest('Lagon,Lily', [1, 5], 2, 'Lagon');
  DoTest('Lagon,Lily', [1, 5], 3, 'Not enough participants');
  DoTest('', [1], 2, 'No participants');
end.
