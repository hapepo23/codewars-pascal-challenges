{
6 kyu
ASCII Fun #1: X-Shape
https://www.codewars.com/kata/5906436806d25f846400009b
}

program x_shape;

{$mode objfpc}{$H+}

uses
  x_shape_unit,
  StrUtils;

  procedure DoTest(n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := X(n);
    writeln('n: ', n);
    writeln('Expected:', LineEnding, ReplaceStr(Expected, '\n', LineEnding));
    writeln('Actual:', LineEnding, ReplaceStr(Actual, '\n', LineEnding));
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(3, '■□■\n□■□\n■□■');
  DoTest(5, '■□□□■\n□■□■□\n□□■□□\n□■□■□\n■□□□■');
  DoTest(7, '■□□□□□■\n□■□□□■□\n□□■□■□□\n□□□■□□□\n□□■□■□□\n□■□□□■□\n■□□□□□■');
end.
