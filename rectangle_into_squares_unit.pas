{
6 kyu
Rectangle into Squares
https://www.codewars.com/kata/55466989aeecab5aac00003e
}

unit rectangle_into_squares_unit;

{$mode objfpc}{$H+}

interface

function SqInRect(lng, wdth: int64): string;

implementation

uses
  SysUtils;

function SqInRect(lng, wdth: int64): string;
var
  rvec: array of string;
  temp, rm: int64;
begin
  rvec := [];
  SetLength(rvec, 0);
  if lng <> wdth then
  begin
    while wdth <> lng do
    begin
      if wdth > lng then
      begin
        temp := lng;
        lng := wdth;
        wdth := temp;
      end;
      rm := lng - wdth;
      SetLength(rvec, Length(rvec) + 1);
      rvec[High(rvec)] := IntToStr(wdth);
      lng := wdth;
      wdth := rm;
    end;
    SetLength(rvec, Length(rvec) + 1);
    rvec[High(rvec)] := IntToStr(wdth);
  end;
  if Length(rvec) = 0 then
    Result := 'nil'
  else
    Result := string.Join(' ', rvec);
end;

end.
