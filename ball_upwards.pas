{
6 kyu
Ball Upwards
https://www.codewars.com/kata/566be96bb3174e155300001b
}

program ball_upwards;

{$mode objfpc}{$H+}

uses
  ball_upwards_unit;
  
procedure DoTest(v0: Int64; Expected: Int64);
var
  Actual: Int64;
begin
  Actual := MaxBall(v0);
  writeln('v0      : ', v0);
  writeln('Expected: ', Expected);
  writeln('Actual  : ', Actual);
  if Expected = Actual then
    writeln('-> OK', LineEnding)
  else
    writeln('-> FAIL', LineEnding)
end;

begin 
  DoTest(37, 10);
  DoTest(45, 13);
  DoTest(99, 28);
  DoTest(196, 55);
end.
