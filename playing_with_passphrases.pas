{
6 kyu
Playing with passphrases
https://www.codewars.com/kata/559536379512a64472000053
}

program playing_with_passphrases;

{$mode objfpc}{$H+}

uses
  playing_with_passphrases_unit;

  procedure DoTest(s: string; n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := PlayPass(s, n);
    writeln('String s: ', s);
    writeln('Shift n : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('I LOVE YOU!!!', 1,
    '!!!vPz fWpM J');
  DoTest('I LOVE YOU!!!', 0,
    '!!!uOy eVoL I');
  DoTest('AAABBCCY', 1,
    'zDdCcBbB');
  DoTest('MY GRANMA CAME FROM NY ON THE 23RD OF APRIL 2015', 2,
    '4897 NkTrC Hq fT67 GjV Pq aP OqTh gOcE CoPcTi aO');
end.
