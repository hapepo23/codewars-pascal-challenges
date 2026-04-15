{
7 kyu
Moves in squared strings (I)
https://www.codewars.com/kata/56dbe0e313c2f63be4000b25
}

program moves_in_squared_strings_1;

{$mode objfpc}{$H+}

uses
  moves_in_squared_strings_1_unit;

type
  TFunctionParameter = function(s: string): string;

  procedure DoTest(f: TFunctionParameter; fname, s: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := Oper(f, s);
    writeln('Func Name: ', fname);
    writeln('String   : ', s);
    writeln('Expected : ', Expected);
    writeln('Actual   : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(@HorMirror, 'HorMirror', 'lVHt\nJVhv\nCSbg\nyeCt', 'yeCt\nCSbg\nJVhv\nlVHt');
  DoTest(@HorMirror, 'HorMirror', '', '');
  DoTest(@HorMirror, 'HorMirror', 'a', 'a');
  DoTest(@HorMirror, 'HorMirror', 'skPBxo\ncSVusJ\nnphcJY\nTqoIuU\nUjoteC\nPytFuP',
    'PytFuP\nUjoteC\nTqoIuU\nnphcJY\ncSVusJ\nskPBxo');
  DoTest(@VertMirror, 'VertMirror', 'hSgdHQ\nHnDMao\nClNNxX\niRvxxH\nbqTVvA\nwvSyRu',
    'QHdgSh\noaMDnH\nXxNNlC\nHxxvRi\nAvVTqb\nuRySvw');
  DoTest(@VertMirror, 'VertMirror', '', '');
  DoTest(@VertMirror, 'VertMirror', 'a', 'a');
  DoTest(@VertMirror, 'VertMirror', 'hSgdHQ\nHnDMao\nClNNxX\niRvxxH\nbqTVvA\nwvSyRu',
    'QHdgSh\noaMDnH\nXxNNlC\nHxxvRi\nAvVTqb\nuRySvw');
end.
