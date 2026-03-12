{
7 kyu
Leap Years
https://www.codewars.com/kata/526c7363236867513f0005ca
}

program leap_years;

{$mode objfpc}{$H+}

uses
  leap_years_unit;

  procedure DoTest(Year: integer; Expected: boolean);
  var
    Actual: boolean;
  begin
    Actual := IsLeapYear(Year);
    writeln('Year    : ', Year);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(2000, True);
  DoTest(2020, True);
  DoTest(2100, False);
  DoTest(2015, False);
end.
