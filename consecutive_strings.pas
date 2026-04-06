{
6 kyu
Consecutive strings
https://www.codewars.com/kata/56a5d994ac971f1ac500003e
}

program consecutive_strings;

{$mode objfpc}{$H+}

uses
  consecutive_strings_unit;

type
  TStringArray = array of string;

  function ArrayToString(A: TStringArray): string;
  var
    i: integer;
    res: string;
  begin
    res := '[';
    for i := 0 to High(A) do
      res += '''' + A[i] + ''', ';
    if (res = '[') then
      Result := '[]'
    else
      Result := Copy(res, 1, Length(res) - 2) + ']';
  end;

  procedure DoTest(strarr: TStringArray; k: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := LongestConsec(strarr, k);
    writeln('Strings : ', ArrayToString(strarr));
    writeln('k       : ', k);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(['red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet'],
    2, 'orangeyellow');
  DoTest(['abcd', 'efghijk', 'lmnop', 'qrst', 'uvwx', 'yzzz', 'lmnop', 'efghijk'],
    3, 'abcdefghijklmnop');
  DoTest(['zone', 'abigail', 'theta', 'form', 'libe', 'zas', 'theta', 'abigail'],
    2, 'abigailtheta');
  DoTest(['it', 'wkppv', 'ixoyx', '3452', 'zzzzzzzzzzzz'],
    3, 'ixoyx3452zzzzzzzzzzzz');
  DoTest([],
    3, '');
end.
