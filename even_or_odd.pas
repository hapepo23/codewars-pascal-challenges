{
8 kyu
Even or Odd
https://www.codewars.com/kata/53da3dbb4a5168369a0000fe
}

program even_or_odd;

{$mode objfpc}{$H+}

uses
  even_or_odd_unit;

  procedure DoTest(Num: integer; Expected: string);
  var
    Actual: string;
  begin
    Actual := EvenOrOdd(Num);
    writeln('Num     : ', Num);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 'Odd');
  DoTest(2, 'Even');
  DoTest(-1, 'Odd');
  DoTest(-2, 'Even');
  DoTest(0, 'Even');
end.
