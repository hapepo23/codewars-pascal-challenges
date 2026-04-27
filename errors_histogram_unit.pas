{
6 kyu
Errors : histogram
https://www.codewars.com/kata/59f44c7bd4b36946fd000052
}

unit errors_histogram_unit;

{$mode objfpc}{$H+}

interface

function Hist(strng: string): string;

implementation

uses
  SysUtils,
  StrUtils;

function HistLine(c: char; cnt: integer): string;
var
  scnt: string;
begin
  if cnt > 0 then
  begin
    scnt := IntToStr(cnt);
    Result := c + '  ' + scnt + DupeString(' ', 6 - Length(scnt)) +
      DupeString('*', cnt) + '\r';
  end
  else
    Result := '';
end;

function Hist(strng: string): string;
var
  c: char;
  countu: integer = 0;
  countw: integer = 0;
  countx: integer = 0;
  countz: integer = 0;
begin
  for c in strng do
    case c of
      'u': countu += 1;
      'w': countw += 1;
      'x': countx += 1;
      'z': countz += 1;
    end;
  Result := HistLine('u', countu) + HistLine('w', countw) +
    HistLine('x', countx) + HistLine('z', countz);
  if Length(Result) >= 2 then
    Result := Copy(Result, 1, Length(Result) - 2);
end;

end.
