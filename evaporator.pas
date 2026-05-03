{
7 kyu
Deodorant Evaporator
https://www.codewars.com/kata/5506b230a11c0aeab3000c1f
}

program evaporator_main;

{$mode objfpc}{$H+}

uses
  SysUtils,
  evaporator_unit;

  procedure DoTest(content, evapPerDay, threshold: double; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Evaporator(content, evapPerDay, threshold);
    writeln('Content   : ', Format('%.7g', [content]));
    writeln('EvapPerDay: ', Format('%.7g', [evapPerDay]));
    writeln('Threshold : ', Format('%.7g', [threshold]));
    writeln('Expected  : ', Expected);
    writeln('Actual    : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(10, 10, 10, 22);
  DoTest(10, 10, 5, 29);
  DoTest(100, 5, 5, 59);
  DoTest(50, 12, 1, 37);
  DoTest(47.5, 8, 8, 31);
  DoTest(100, 1, 1, 459);
  DoTest(10, 1, 1, 459);
  DoTest(100, 1, 5, 299);
end.
