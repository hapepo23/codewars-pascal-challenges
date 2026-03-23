{
8 kyu
Function 1 - hello world
https://www.codewars.com/kata/523b4ff7adca849afe000035
}

program hello_world;

{$mode objfpc}{$H+}

uses
  hello_world_unit;

  procedure DoTest(Expected: string);
  var
    Actual: string;
  begin
    Actual := Greet;
    writeln('Expected       : ', Expected);
    writeln('Actual         : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('hello world!');
end.
