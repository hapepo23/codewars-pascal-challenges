{
6 kyu
Moves in squared strings (III)
https://www.codewars.com/kata/56dbeec613c2f63be4000be6
}

program moves_in_squared_strings_3;

{$mode objfpc}{$H+}

uses
  moves_in_squared_strings_3_unit;

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
  DoTest(@Rot90Clock, 'Rot90Clock', 'rgavce\nvGcEKl\ndChZVW\nxNWgXR\niJBYDO\nSdmEKb',
    'Sixdvr\ndJNCGg\nmBWhca\nEYgZEv\nKDXVKc\nbORWle');
  DoTest(@Rot90Clock, 'Rot90Clock', 'EFAxSN\nXbJObC\nMrNVyg\nUKqDsE\nrYnAfU\nnNjADZ',
    'nrUMXE\nNYKrbF\njnqNJA\nAADVOx\nDfsybS\nZUEgCN');
  DoTest(@Rot90Clock, 'Rot90Clock', 'RPusfa\nvxieXA\nEGNMDi\nWjYSQJ\nnpMqdK\nTYvcbx',
    'TnWEvR\nYpjGxP\nvMYNiu\ncqSMes\nbdQDXf\nxKJiAa');
  DoTest(@Diag1Sym, 'Diag1Sym', 'wuUyPC\neNHWxw\nehifmi\ntBTlFI\nvWNpdv\nIFkGjZ',
    'weetvI\nuNhBWF\nUHiTNk\nyWflpG\nPxmFdj\nCwiIvZ');
  DoTest(@Diag1Sym, 'Diag1Sym', 'qAdPMX\nkRIQKU\nJeoroo\nNwVbtn\nAmQUqi\nVguxub',
    'qkJNAV\nARewmg\ndIoVQu\nPQrbUx\nMKotqu\nXUonib');
  DoTest(@Diag1Sym, 'Diag1Sym', 'gBHG\nmjIc\nJgkG\nfPjL', 'gmJf\nBjgP\nHIkj\nGcGL');
  DoTest(@SelfieAndDiag1, 'SelfieAndDiag1',
    'NJVGhr\nMObsvw\ntPhCtl\nsoEnhi\nrtQRLK\nzjliWg',
    'NJVGhr|NMtsrz\nMObsvw|JOPotj\ntPhCtl|VbhEQl\nsoEnhi|GsCnRi\nrtQRLK|hvthLW\nzjliWg|rwliKg');
  DoTest(@SelfieAndDiag1, 'SelfieAndDiag1', 'JAAn\nsrpa\nFngg\nmrVJ',
    'JAAn|JsFm\nsrpa|Arnr\nFngg|ApgV\nmrVJ|nagJ');
end.
