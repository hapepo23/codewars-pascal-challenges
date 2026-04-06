{
6 kyu
Playing with passphrases
https://www.codewars.com/kata/559536379512a64472000053
}

unit playing_with_passphrases_unit;

{$mode objfpc}{$H+}

interface

function PlayPass(s: string; n: int64): string;

implementation

uses
  StrUtils;

function PlayPass(s: string; n: int64): string;
const
  ordab = Ord('A');
  ordas = Ord('a');
  ord9 = Ord('9');
  ord0 = Ord('0');
var
  i, l: int64;
begin
  l := Length(s);
  for i := 1 to l do
  begin
    if s[i] in ['A'..'Z'] then
    begin
      s[i] := Chr(((Ord(s[i]) - ordab + n) mod 26) + ordab);
      if Odd(i - 1) then
        s[i] := Chr(Ord(s[i]) - ordab + ordas);
    end
    else if s[i] in ['0'..'9'] then
      s[i] := Chr(Ord9 - Ord(s[i]) + Ord0);
  end;
  Result := ReverseString(s);
end;

end.
