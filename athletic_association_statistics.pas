{
6 kyu
Statistics for an Athletic Association
https://www.codewars.com/kata/55b3425df71c1201a800009c
}

program athletic_association_statistics;

{$mode objfpc}{$H+}

uses
  athletic_association_statistics_unit;

  procedure DoTest(s: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := Stat(s);
    writeln('Results : ', s);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('',
    '');
  DoTest('01|15|59, 1|47|16, 01|17|20, 1|32|34, 2|17|17',
    'Range: 01|01|18 Average: 01|38|05 Median: 01|32|34');
  DoTest('02|15|59, 2|47|16, 02|17|20, 2|32|34, 2|17|17, 2|22|00, 2|31|41',
    'Range: 00|31|17 Average: 02|26|18 Median: 02|22|00');
  DoTest('02|15|59, 02|17|20, 2|16|34, 002|17|17, 2|27|00, 2|16|41',
    'Range: 00|11|01 Average: 02|18|28 Median: 02|16|59');
end.
