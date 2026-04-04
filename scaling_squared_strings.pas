{
7 kyu
Scaling Squared Strings
https://www.codewars.com/kata/56ed20a2c4e5d69155000301
}

program scaling_squared_strings;

{$mode objfpc}{$H+}

uses
  StrUtils,
  scaling_squared_strings_unit;

  procedure DoTest(s: string; k, n: integer; Expected: string);
  var
    Actual: string;
  begin
    Actual := Scale(s, k, n);
    writeln('String s: ', LineEnding, ReplaceStr(s, '\n', LineEnding));
    writeln('k-hor. scaling: ', k);
    writeln('n-vert.scaling: ', n);
    writeln('Expected: ', LineEnding, ReplaceStr(Expected, '\n', LineEnding));
    writeln('Actual: ', LineEnding, ReplaceStr(Actual, '\n', LineEnding));
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('abcd\nefgh\nijkl\nmnop', 2, 3,
    'aabbccdd\naabbccdd\naabbccdd\neeffgghh\neeffgghh\neeffgghh\niijjkkll\n' +
    'iijjkkll\niijjkkll\nmmnnoopp\nmmnnoopp\nmmnnoopp');
  DoTest('', 5, 5, '');
  DoTest('Kj\nSH', 1, 2, 'Kj\nKj\nSH\nSH');
  DoTest('lxnT\nqiut\nZZll\nFElq', 1, 2,
    'lxnT\nlxnT\nqiut\nqiut\nZZll\nZZll\nFElq\nFElq');
end.
