{
6 kyu
A Rule of Divisibility by 13
https://www.codewars.com/kata/564057bc348c7200bd0000ff
}

program divisibility_by_thirteen;

{$mode objfpc}{$H+}

uses
  divisibility_by_thirteen_unit;

  procedure DoTest(n: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Thirt(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK   : ', n mod 13, '/', Actual mod 13, LineEnding)
    else
      writeln('-> FAIL : ', n mod 13, '/', Actual mod 13, LineEnding);
  end;

begin
  DoTest(1234567, 87);
  DoTest(321, 48);
  DoTest(8529, 79);
  DoTest(5634, 57);
  DoTest(1111111111, 71);
  DoTest(1234567890123456789, 69);
  DoTest(1234567890123456785, 65);
  DoTest(0, 0);
  DoTest(12, 12);
  DoTest(13, 13);
end.
