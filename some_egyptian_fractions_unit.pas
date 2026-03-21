{
5 kyu
Some Egyptian fractions
https://www.codewars.com/kata/54f8693ea58bce689100065f
}

unit some_egyptian_fractions_unit;

{$mode objfpc}{$H+}

interface

function Decompose(nrStr, drStr: string): string;

implementation

uses
  SysUtils;

var
  resultsbuffer: string;

procedure EgyptianFraction(n, d: int64);
var
  x: int64;
begin
  if d mod n = 0 then
  begin
    resultsbuffer := resultsbuffer + '1/' + IntToStr(d div n) + ', ';
    exit();
  end;
  x := d div n + 1;
  resultsbuffer := resultsbuffer + '1/' + IntToStr(x) + ', ';
  EgyptianFraction(n * x - d, d * x);
end;

function Decompose(nrStr, drStr: string): string;
var
  nr, dr, frac: int64;
begin
  nr := StrtoInt64(nrStr);
  dr := StrtoInt64(drStr);
  if nr = 0 then
    Exit('[]');
  frac := nr div dr;
  if frac >= 1 then
  begin
    Result := '[' + IntToStr(frac);
    if nr mod dr = 0 then
      Exit(Result + ']');
    nr := nr - frac * dr;
    Result := Result + ', ';
  end
  else
    Result := '[';
  resultsbuffer := '';
  EgyptianFraction(nr, dr);
  Result := Result + resultsbuffer;
  if Copy(Result, Length(Result) - 1) = ', ' then
    Result := Copy(Result, 0, Length(Result) - 2);
  Result := Result + ']';
end;

end.
