{
6 kyu
Errors : histogram
https://www.codewars.com/kata/59f44c7bd4b36946fd000052
}

program errors_histogram;

{$mode objfpc}{$H+}

uses
  StrUtils,
  errors_histogram_unit;

  procedure DoTest(strng: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := Hist(strng);
    writeln('String  : ', LineEnding, strng);
    writeln('Expected: ', LineEnding, ReplaceStr(Expected, '\r', LineEnding));
    writeln('Actual  : ', LineEnding, ReplaceStr(Actual, '\r', LineEnding));
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('uuuuuuuuuuuuuuuuwwwwwwwwwwwwwwwwwwxxxxxxxxxxxxxxxxxxzzzzzzzzzzzzz',
    'u  16    ****************\rw  18    ******************\rx  18    ******************\rz  13    *************');
  DoTest('tpwaemuqxdmwqbqrjbeosjnejqorxdozsxnrgpgqkeihqwybzyymqeazfkyiucesxwutgszbenzvgxibxrlvmzihcb',
    'u  3     ***\rw  4     ****\rx  6     ******\rz  6     ******');
  DoTest('aaifzlnderpeurcuqjqeywdq', 'u  2     **\rw  1     *\rz  1     *');
  DoTest('sjeneccyhrcpfvpujfaoaykqllteovskclebmzjeqepilxygdmzvdfmxbqdzubkzturnuqxsewrwgmdfwgdx',
    'u  4     ****\rw  3     ***\rx  4     ****\rz  4     ****');
  DoTest('', '');
end.
