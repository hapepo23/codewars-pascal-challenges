{
6 kyu
up AND down
https://www.codewars.com/kata/56cac350145912e68b0006f0
}

program up_and_down;

{$mode objfpc}{$H+}

uses
  up_and_down_unit;

  procedure DoTest(Expected, s: string);
  var
    Actual: string;
  begin
    Actual := Arrange(s);
    writeln('String s: ', s);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('who RETAINING hit THAT a THE we TAKEN',
    'who hit retaining The That a we taken');
  DoTest('', '');
  DoTest('i CAME on WERE up GRANDMOTHERS so', 'on I came up were so grandmothers');
  DoTest('way THE my WALL him THEM', 'way the my wall them him');
  DoTest('turn GREAT-AUNTS know AUNT a LOOK to BACK',
    'turn know great-aunts aunt look A to back');
end.
