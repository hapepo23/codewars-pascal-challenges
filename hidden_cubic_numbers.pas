{
6 kyu
Hidden "Cubic" numbers
https://www.codewars.com/kata/55031bba8cba40ada90011c4
}

program hidden_cubic_numbers;

{$mode objfpc}{$H+}

uses
  hidden_cubic_numbers_unit;

var
  s: string;

  procedure DoTest(s: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := IsSumOfCubes(s);
    writeln('String  : ', s);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  s := '&z _upon 407298a --- ???ry, ww/100 I thought, 631str*ng and w===y -721&()';
  dotest(s, '407 407 Lucky');
  s := '';
  dotest(s, 'Unlucky');
  s := '0 9026315 -827&()';
  dotest(s, '0 0 Lucky');
  s := '&z _upon 407298a --- ???ry, ww/100 I thought, 631str*ng and w===y -721&() 1531 0';
  dotest(s, '407 153 1 0 561 Lucky');
  s := 'Once upon a midnight dreary, while100 I pondered, 9026315weak and weary -827&()';
  dotest(s, 'Unlucky');
end.
