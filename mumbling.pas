{
7 kyu
Mumbling
https://www.codewars.com/kata/5667e8f4e3f572a8f2000039
}

program mumbling;

{$mode objfpc}{$H+}

uses
  mumbling_unit;

  procedure DoTest(s: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := Accum(s);
    writeln('s       : ', s);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('ZpglnRxqenU',
          'Z-Pp-Ggg-Llll-Nnnnn-Rrrrrr-Xxxxxxx-Qqqqqqqq-Eeeeeeeee-Nnnnnnnnnn-' +
          'Uuuuuuuuuuu');
  DoTest('NyffsGeyylB',
          'N-Yy-Fff-Ffff-Sssss-Gggggg-Eeeeeee-Yyyyyyyy-Yyyyyyyyy-Llllllllll-' +
          'Bbbbbbbbbbb');
end.

