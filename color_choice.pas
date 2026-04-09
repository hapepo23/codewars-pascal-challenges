{
6 kyu
Color Choice
https://www.codewars.com/kata/55be10de92aad5ef28000023
}

program color_choice;

{$mode objfpc}{$H+}

uses
  color_choice_unit;

  procedure DoTest(m, n: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := CheckChoose(m, n);
    writeln('m       : ', m);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(6, 4, 2);
  DoTest(4, 4, 1);
  DoTest(4, 2, -1);
  DoTest(35, 7, 3);
  DoTest(36, 7, -1);
  DoTest(47129212243960, 50, 20);
  DoTest(47129212243961, 50, -1);
end.
