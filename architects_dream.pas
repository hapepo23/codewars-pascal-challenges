{
6 kyu
Architect's Dream: drawing curves, observing, thinking
https://www.codewars.com/kata/5db19d503ec3790012690c11
}

program architects_dream;

{$mode objfpc}{$H+}

uses
  SysUtils,
  architects_dream_unit;

  procedure DoTest(n, w: int64; Expected: double);
  var
    Actual: double;
  begin
    Actual := Weight(n, w);
    writeln('n       : ', n);
    writeln('w       : ', w);
    writeln('Expected: ', Format('%.14g', [Expected]));
    writeln('Actual  : ', Format('%.14g', [Actual]));
    if Abs(Expected - Actual) < 1e-5 then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 4037, 599.48859618035);
  DoTest(2, 4037, 680.62055514153);
  DoTest(3, 4037, 691.60057178709);
  DoTest(4, 4037, 693.08655544975);
  DoTest(26, 4037, 693.319138109800);
  DoTest(23, 2997, 514.708312339626);
  DoTest(14, 4456, 765.278691953673);
  DoTest(38, 2444, 419.735440559909);
end.
