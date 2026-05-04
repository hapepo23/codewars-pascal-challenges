{
7 kyu
Mumbling
https://www.codewars.com/kata/5667e8f4e3f572a8f2000039
}

unit mumbling_unit;

{$mode objfpc}{$H+}

interface

function Accum(s: string): string;

implementation

uses
  SysUtils,
  StrUtils;

function Accum(s: string): string;
var
  i: Integer;
begin
  Result := '';
  for i:= 1 to Length(s) do
  begin
    if i > 1 then
      Result += '-';
    Result += UpperCase(s[i]) + DupeString(LowerCase(s[i]), i-1);
  end;
end;

end.

