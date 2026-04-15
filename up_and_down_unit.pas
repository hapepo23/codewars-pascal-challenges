{
6 kyu
up AND down
https://www.codewars.com/kata/56cac350145912e68b0006f0
}

unit up_and_down_unit;

{$mode objfpc}{$H+}

interface

function Arrange(s: string): string;

implementation

uses
  StrUtils,
  SysUtils;

function Arrange(s: string): string;
var
  words: array of string;
  i: integer;
  temp: string;
begin
  words := s.Split([' ']);
  for i := 0 to High(words) - 1 do
  begin
    if i mod 2 = 0 then
    begin
      if Length(words[i]) > Length(words[i + 1]) then
      begin
        temp := words[i];
        words[i] := words[i + 1];
        words[i + 1] := temp;
      end;
    end
    else
    begin
      if Length(words[i]) < Length(words[i + 1]) then
      begin
        temp := words[i];
        words[i] := words[i + 1];
        words[i + 1] := temp;
      end;
    end;
  end;
  for i := 0 to High(words) do
  begin
    if (i mod 2 = 0) then
      words[i] := LowerCase(words[i])
    else
      words[i] := UpperCase(words[i]);
  end;
  Result := string.Join(' ', words);
end;

end.
