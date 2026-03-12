{
7 kyu
Leap Years
https://www.codewars.com/kata/526c7363236867513f0005ca
}

unit leap_years_unit;

{$mode objfpc}{$H+}

interface

function IsLeapYear(Year: integer): boolean;

implementation

function IsLeapYear(Year: integer): boolean;
begin
  if Year mod 400 = 0 then
    Result := True
  else if Year mod 100 = 0 then
    Result := False
  else if Year mod 4 = 0 then
    Result := True
  else
    Result := False;
end;

end.
