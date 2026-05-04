{
7 kyu
Printer Errors
https://www.codewars.com/kata/56541980fa08ab47a0000040
}

program printer_errors;

{$mode objfpc}{$H+}

uses
  printer_errors_unit;

  procedure DoTest(s: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := PrinterError(s);
    writeln('s       : ', s);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz', '3/56');
  DoTest('kkkwwwaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz', '6/60');
  DoTest('kkkwwwaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyzuuuuu', '11/65');
end.
