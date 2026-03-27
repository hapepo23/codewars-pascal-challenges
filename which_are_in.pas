{
6 kyu
Which are in?
https://www.codewars.com/kata/550554fd08b86f84fe000a58
}

program which_are_in;

{$mode objfpc}{$H+}

uses
  which_are_in_unit,
  SysUtils;

  function ArrayToString(A: TStringArray): string;
  var
    i: int64;
    res: string;
  begin
    res := '[';
    for i := 0 to High(A) do
    begin
      res += '"' + A[i] + '"' + ',';
    end;
    if (res = '[') then
      Result := '[]'
    else
      Result := Copy(res, 1, Length(res) - 1) + ']';
  end;

  procedure DoTest(a1, a2: TStringArray; Expected: TStringArray);
  var
    Actual: TStringArray;
    ActualStr, ExpectedStr: string;
  begin
    Actual := inArray(a1, a2);
    ActualStr := ArrayToString(Actual);
    ExpectedStr := ArrayToString(Expected);
    writeln('Array 1 : ', ArrayToString(a1));
    writeln('Array 2 : ', ArrayToString(a2));
    writeln('Expected: ', ExpectedStr);
    writeln('Actual  : ', ActualStr);
    if ExpectedStr = ActualStr then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(['live', 'arp', 'strong', 'der', 'ong', 'arp', 'arp', 'live'],
    ['lively', 'alive', 'harp', 'sharp', 'armstrong'],
    ['arp', 'live', 'ong', 'strong']);
  DoTest(['arp', 'mice', 'bull'],
    ['lively', 'alive', 'harp', 'sharp', 'armstrong'],
    ['arp']);
  DoTest(['cod', 'code', 'wars', 'ewar'],
    ['lively', 'alive', 'harp', 'sharp', 'armstrong', 'codewars'],
    ['cod', 'code', 'ewar', 'wars']);
  DoTest(['cod', 'code', 'wars', 'ewar', 'ar'],
    ['lively', 'alive', 'harp', 'sharp', 'armstrong', 'codewars'],
    ['ar', 'cod', 'code', 'ewar', 'wars']);
  DoTest(['cod', 'code', 'wars', 'ewar', 'ar'],
    [],
    []);
end.
