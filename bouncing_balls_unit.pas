{
6 kyu
Bouncing Balls
https://www.codewars.com/kata/5544c7a5cb454edb3c000047
}

unit bouncing_balls_unit;

{$mode objfpc}{$H+}

interface

function BouncingBall(h, bounce, window: double): int64;

implementation

function BouncingBall(h, bounce, window: double): int64;
begin
  if (h <= 0) or (bounce <= 0) or (bounce >= 1) or (window <= 0) or (window >= h) then
    Exit(-1);
  Result := 1;
  h *= bounce;
  while h > window do
  begin
    Inc(Result, 2);
    h *= bounce;
  end;
end;

end.
