{
7 kyu
Sum of Numbers
https://www.codewars.com/kata/55f2b110f61eb01779000053
}

program sum_of_numbers;

{$mode objfpc}{$H+}

uses
  sum_of_numbers_unit;

  procedure DoTest(a: int64; b: int64; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := GetSum(a, b);
    writeln('From a  : ', a);
    writeln('To b    : ', b);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(0, 0, 0);
  DoTest(22, 22, 22);
  DoTest(5, -1, 14);
  DoTest(505, 4, 127759);
  DoTest(-50, 0, -1275);
  DoTest(-1, -5, -15);
  DoTest(-505, 4, -127755);
  DoTest(-321, 123, -44055);
  DoTest(528, 318, 89253);
  DoTest(-204, 221, 3621);
  DoTest(-476, -275, -75851);
  DoTest(-432, -562, -65107);
  DoTest(-131, 251, 22980);
  DoTest(-388, 433, 18495);
  DoTest(-216, 225, 1989);
  DoTest(-322, 538, 92988);
  DoTest(-251, 84, -28056);
  DoTest(-43, -160, -11977);
  DoTest(188, -503, -108990);
end.
