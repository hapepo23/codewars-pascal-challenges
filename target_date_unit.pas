{
7 kyu
Target Date
https://www.codewars.com/kata/569218bc919ccba77000000b
}

unit target_date_unit;

{$mode objfpc}{$H+}

interface

function DateNbDays(a0, a, p: double): string;

implementation

uses
  DateUtils,
  SysUtils;

function DateNbDays(a0, a, p: double): string;
var
  dailyfactor: double;
  days: integer;
begin
  dailyfactor := 1.0 + p / 36000.0;
  days := 0;
  while a0 < a do
  begin
    a0 := a0 * dailyfactor;
    Inc(days);
  end;
  Result := FormatDateTime('YYYY-MM-DD', IncDay(EncodeDate(2016, 1, 1), days));
end;

end.
