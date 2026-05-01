{
6 kyu
Detect Pangram
https://www.codewars.com/kata/545cedaa9943f7fe7b000048
}

program detect_pangram;

{$mode objfpc}{$H+}

uses
  detect_pangram_unit;

  procedure DoTest(Expected: boolean; s: string);
  var
    Actual: boolean;
  begin
    Actual := IsPangram(s);
    writeln('Sentence: ', s);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(True, 'Cwm fjord bank glyphs vext quiz');
  DoTest(True, 'Pack my box with five dozen liquor jugs.');
  DoTest(True, 'How quickly daft jumping zebras vex.');
  DoTest(True, 'ABCD45EFGH,IJK,LMNOPQR56STUVW3XYZ');
  DoTest(True, 'AbCdEfGhIjKlM zYxWvUtSrQpOn');
  DoTest(False, 'abcdefghijklmopqrstuvwxyz ');
  DoTest(False, 'This isn''t a pangram!');
  DoTest(False, 'aaaaaaaaaaaaaaaaaaaaaaaaaa');
  DoTest(False, 'Detect Pangram');
  DoTest(False,
    'A pangram is a sentence that contains every single letter of the alphabet at least once.');
end.
