{
7 kyu
Two to One
https://www.codewars.com/kata/5656b6906de340bd1b0000ac
}

program two_to_one;

{$mode objfpc}{$H+}

uses
  two_to_one_unit;

  procedure DoTest(s1, s2, Expected: string);
  var
    Actual: string;
  begin
    Actual := Longest(s1, s2);
    writeln('String 1: ', s1);
    writeln('String 2: ', s2);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('aretheyhere', 'yestheyarehere', 'aehrsty');
  DoTest('loopingisfunbutdangerous', 'lessdangerousthancoding',
    'abcdefghilnoprstu');
  DoTest('inmanylanguages', 'theresapairoffunctions', 'acefghilmnoprstuy');
  DoTest('lordsofthefallen', 'gamekult', 'adefghklmnorstu');
  DoTest('codewars', 'codewars', 'acdeorsw');
  DoTest('agenerationmustconfrontthelooming', 'codewarrs',
    'acdefghilmnorstuw');
end.
