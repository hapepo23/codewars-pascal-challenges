{
5 kyu
Is my friend cheating?
https://www.codewars.com/kata/5547cc7dcad755e480000004
}

program is_my_friend_cheating;

{$mode objfpc}{$H+}

uses
  is_my_friend_cheating_unit;

  procedure DoTest(n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := RemovedNumbers(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(300, '162 276,276 162');
  DoTest(311, '202 238,238 202');
  DoTest(369, '213 318,318 213');
  DoTest(1000007, '');
end.
