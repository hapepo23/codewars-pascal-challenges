{
6 kyu
Moves in squared strings (II)
https://www.codewars.com/kata/56dbe7f113c2f63570000b86
}

program moves_in_squared_strings_2;

{$mode objfpc}{$H+}

uses
  moves_in_squared_strings_2_unit;

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
  DoTest(@Rot, 'Rot', 'fijuoo\nCqYVct\nDrPmMJ\nerfpBA\nkWjFUG\nCVUfyL',
    'LyfUVC\nGUFjWk\nABpfre\nJMmPrD\ntcVYqC\nooujif');
  DoTest(@Rot, 'Rot', 'rkKv\ncofM\nzXkh\nflCB', 'BClf\nhkXz\nMfoc\nvKkr');
  DoTest(@Rot, 'Rot', 'lVHt\nJVhv\nCSbg\nyeCt', 'tCey\ngbSC\nvhVJ\ntHVl');
  DoTest(@SelfieAndRot, 'SelfieAndRot', 'xZBV\njsbS\nJcpN\nfVnP',
    'xZBV....\njsbS....\nJcpN....\nfVnP....\n....PnVf\n....NpcJ\n....Sbsj\n....VBZx');
  DoTest(@SelfieAndRot, 'SelfieAndRot', 'uLcq\nJkuL\nYirX\nnwMB',
    'uLcq....\nJkuL....\nYirX....\nnwMB....\n....BMwn\n....XriY\n....LukJ\n....qcLu');
  DoTest(@SelfieAndRot, 'SelfieAndRot', 'pR\nKo', 'pR..\nKo..\n..oK\n..Rp');
  DoTest(@SelfieAndRot, 'SelfieAndRot', 'QA\npe', 'QA..\npe..\n..ep\n..AQ');
end.
