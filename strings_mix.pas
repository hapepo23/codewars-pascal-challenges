{
4 kyu
Strings Mix
https://www.codewars.com/kata/5629db57620258aa9d000014
}

program strings_mix;

{$mode objfpc}{$H+}

uses
  strings_mix_unit;

  procedure DoTest(s1, s2: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := Mix(s1, s2);
    writeln('s1      : ', s1);
    writeln('s2      : ', s2);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('Are they here', 'yes, they are here', '2:eeeee/2:yy/=:hh/=:rr');
  DoTest('looping is fun but dangerous', 'less dangerous than coding',
    '1:ooo/1:uuu/2:sss/=:nnn/1:ii/2:aa/2:dd/2:ee/=:gg');
  DoTest(' In many languages', ' there"s a pair of functions',
    '1:aaa/1:nnn/1:gg/2:ee/2:ff/2:ii/2:oo/2:rr/2:ss/2:tt');
  DoTest('Lords of the Fallen', 'gamekult', '1:ee/1:ll/1:oo');
  DoTest('codewars', 'codewars', '');
  DoTest('A generation must confront the looming ', 'codewarrs',
    '1:nnnnn/1:ooooo/1:tttt/1:eee/1:gg/1:ii/1:mm/=:rr');
  DoTest('Given two strings s1 and s2, we want to visualize how different',
    'So the maximum for ''a'' in s1 and s2 is 4 from s1; ' +
    'the maximum for ''b'' is 3 from s2.',
    '2:mmmmmmmm/2:ssssss/1:eeeee/1:nnnnn/1:ttttt/2:ooooo/=:iiiii/1:wwww/' +
    '2:aaaa/2:ffff/2:rrrr/1:dd/1:vv/2:hh/2:uu/2:xx');
  DoTest('Earn extra honor and gain new allies: invite code warriors!',
    'Earn extra honor and gain new allies: invite code warriors!',
    '=:aaaaaa/=:nnnnnn/=:rrrrrr/=:eeeee/=:iiiii/=:oooo/=:dd/=:ll/=:ss/' +
    '=:tt/=:ww');
end.
