{
7 kyu
Printer Errors
https://www.codewars.com/kata/56541980fa08ab47a0000040
}

unit printer_errors_unit;

{$mode objfpc}{$H+}

interface

function PrinterError(s: string): string;

implementation

uses
  SysUtils;

function PrinterError(s: string): string;
var
  total: integer = 0;
  err: integer = 0;
  c: char;
begin
  for c in s do
  begin
    Inc(total);
    if (c < 'a') or (c > 'm') then
      Inc(err);
  end;
  Result := Format('%d/%d', [err, total]);
end;

end.
