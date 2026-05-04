{
7 kyu
Maximum Length Difference
https://www.codewars.com/kata/5663f5305102699bad000056
}

program maximum_length_difference;

{$mode objfpc}{$H+}

uses
  maximum_length_difference_unit;

type
  TStringArray = array of string;

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

  procedure DoTest(a1, a2: TStringArray; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := MxDifLg(a1, a2);
    writeln('a1      : ', ArrayToString(a1));
    writeln('a2      : ', ArrayToString(a2));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(['hoqq', 'bbllkw', 'oox', 'ejjuyyy', 'plmiis', 'xxxzgpsssa',
    'xxwwkktt', 'znnnnfqknaz', 'qqquuhii', 'dvvvwz'],
    ['cccooommaaqqoxii', 'gggqaffhhh', 'tttoowwwmmww'], 13);
  DoTest(['ejjjjmmtthh', 'zxxuueeg', 'aanlljrrrxx', 'dqqqaaabbb',
    'oocccffuucccjjjkkkjyyyeehh'], ['bbbaaayddqbbrrrv'], 10);
  DoTest([], ['cccooommaaqqoxii', 'gggqaffhhh', 'tttoowwwmmww'], -1);
end.
