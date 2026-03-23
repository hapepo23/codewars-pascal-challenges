{
6 kyu
Binaries
https://www.codewars.com/kata/5d98b6b38b0f6c001a461198
}

program binaries;

{$mode objfpc}{$H+}

uses
  binaries_unit;

  procedure DoTest(str: string; expected: string);
  var
    actual: string;
  begin
    writeln('Encoding...');
    actual := Code(str);
    writeln('String   : "', str, '"');
    writeln('Expected : "', expected, '"');
    writeln('Actual   : "', actual, '"');
    if expected = actual then
      writeln('-> OK')
    else
      writeln('-> FAIL');
    writeln('Decoding...');
    actual := Decode(expected);
    writeln('String   : "', expected, '"');
    writeln('Expected : "', str, '"');
    writeln('Actual   : "', actual, '"');
    if str = actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('07', '10001111');
  DoTest('62', '0011100110');
  DoTest('69', '00111000011001');
  DoTest('86', '00011000001110');
  DoTest('55337700', '001101001101011101110011110011111010');
  DoTest('33198877334422',
    '01110111110001100100011000000110000011110011110111011100110000110001100110');
  DoTest('1119441933000055',
    '1111110001100100110000110011000110010111011110101010001101001101');
  DoTest('444666333666777444',
    '001100001100001100001110001110001110011101110111001110001110001110001111001111001111001100001100001100');
  DoTest('55500011144466666699919777777',
    '0011010011010011011010101111110011000011000011000011100011100011100011100011100011100001100100011001000110011100011001001111001111001111001111001111001111');
  DoTest('3331977777733322222211100019888',
    '01110111011111000110010011110011110011110011110011110011110111011101110110011001100110011001101111111010101100011001000110000001100000011000');
end.
