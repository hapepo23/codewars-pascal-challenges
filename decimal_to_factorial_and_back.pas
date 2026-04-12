{
5 kyu
Decimal to Factorial and Back
https://www.codewars.com/kata/54e320dcebe1e583250008fd
}

program decimal_to_factorial_and_back;

{$mode objfpc}{$H+}

uses
  decimal_to_factorial_and_back_unit;

  procedure DoTest1(nb: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := Dec2FactString(nb);
    writeln('Decimal : ', nb);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

  procedure DoTest2(str: string; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := FactString2Dec(str);
    writeln('Factorial: ', str);
    writeln('Expected : ', Expected);
    writeln('Actual   : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest1(463, '341010');
  DoTest1(2982, '4041000');
  DoTest1(2990, '4042100');
  DoTest1(36287999, '99876543210');
  DoTest1(36288000, 'A0000000000');
  DoTest1(20922789887999, 'FEDCBA9876543210');
  DoTest1(6639527386, 'DA36663441200');
  DoTest2('341010', 463);
  DoTest2('4041000', 2982);
  DoTest2('4042100', 2990);
  DoTest2('99876543210', 36287999);
  DoTest2('A0000000000', 36288000);
  DoTest2('FEDCBA9876543210', 20922789887999);
  DoTest2('DA36663441200', 6639527386);
  DoTest2('10A36663441200', 6639527386);
end.
