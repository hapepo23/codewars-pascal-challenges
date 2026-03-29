{
7 kyu
Target Date
https://www.codewars.com/kata/569218bc919ccba77000000b
}

program target_date;

{$mode objfpc}{$H+}

uses
  target_date_unit;

  procedure DoTest(a0, a, p: double; Expected: string);
  var
    Actual: string;
  begin
    Actual := DateNbDays(a0, a, p);
    writeln('Money amount a0 on 2016-01-01 : ', a0: 8: 2);
    writeln('Desired money amount a        : ', a: 8: 2);
    writeln('Interest rate p (%) per 360 d : ', p: 8: 2);
    writeln('Expected date reached a       : ', Expected);
    writeln('Actual date reached a         : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(100, 101, 0.98, '2017-01-01');
  DoTest(100, 150, 2.00, '2035-12-26');
  DoTest(4281, 5087, 2, '2024-07-03');
  DoTest(4620, 5188, 2, '2021-09-19');
  DoTest(9999, 11427, 6, '2018-03-13');
  DoTest(7265, 9111, 8, '2018-10-16');
end.
