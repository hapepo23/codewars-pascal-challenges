{
6 kyu
Playing on a chessboard
https://www.codewars.com/kata/55ab4f980f2d576c070000f4
}

unit playing_on_a_chessboard_unit;

{$mode objfpc}{$H+}

interface

function Game(n: int64): string;

implementation

uses
  SysUtils;

function Game(n: int64): string;
begin
  if Odd(n) then
    Result := Format('[%d, 2]', [n * n])
  else
    Result := Format('[%d]', [(n * n) div 2]);
end;

end.
