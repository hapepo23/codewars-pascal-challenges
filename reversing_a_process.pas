{
6 kyu
Reversing a Process
https://www.codewars.com/kata/5dad6e5264e25a001918a1fc
}

program reversing_a_process;

{$mode objfpc}{$H+}

uses
  reversing_a_process_unit;

  procedure DoTest(s: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := Decode(s);
    writeln('String  : ', s);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('1273409kuqhkoynvvknsdwljantzkpnmfgf', 'uogbucwnddunktsjfanzlurnyxmx');
  DoTest('761328qockcouoqmoayqwmkkic', 'Impossible to decode');
  DoTest('3354197gtenwuwqdygpnwconjeywp', 'qdcnykyivmqbnyounlcmyb');
  DoTest('1046635sjmzbanpsqtudulyeftadf', 'ohsfvandoyjelexkgbjalb');
end.
