{
6 kyu
Reverse or rotate?
https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991
}

program reverse_or_rotate;

{$mode objfpc}{$H+}

uses
  reverse_or_rotate_unit;

  procedure DoTest(str: string; sz: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := RevRot(str, sz);
    writeln('String    : ', str);
    writeln('Chunk size: ', sz);
    writeln('Expected  : ', Expected);
    writeln('Actual    : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  Dotest('1234', 0, '');
  Dotest('', 0, '');
  Dotest('1234', 5, '');
  Dotest('733049910872815764',
    5, '330479108928157');
  Dotest('73304991087281576455176044327690580265896',
    8, '1994033775182780067155464327690480265895');
end.
