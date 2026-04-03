{
5 kyu
Is my friend cheating?
https://www.codewars.com/kata/5547cc7dcad755e480000004
}

unit is_my_friend_cheating_unit;

{$mode objfpc}{$H+}

interface

function RemovedNumbers(n: int64): string;

implementation

uses
  SysUtils;

function RemovedNumbers(n: int64): string;
var
  p, b, bb, a: int64;
begin
  Result := '';
  p := n * (n + 1);
  for b := n downto 1 do
  begin
    bb := 2 * b;
    if (p - bb) mod (bb + 2) = 0 then
    begin
      a := (p - bb) div (bb + 2);
      if a < n then
      begin
        if Result <> '' then
          Result += ',';
        Result += IntToStr(a) + ' ' + IntToStr(b);
      end;
    end;
  end;
end;

end.
