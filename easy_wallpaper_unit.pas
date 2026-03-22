{
7 kyu
Easy wallpaper
https://www.codewars.com/kata/567501aec64b81e252000003
}

unit easy_wallpaper_unit;

{$mode objfpc}{$H+}

interface

function WallPaper(l, w, h: double): string;

implementation

uses
  SysUtils,
  Math;

const
  numbers: array[0..20] of string =
    ('zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven',
    'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen',
    'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty');

function WallPaper(l, w, h: double): string;
var
  area: double;
  rolls: integer;
begin
  if (l = 0.0) or (w = 0.0) then
    area := 0.0
  else
    area := (l * 2.0 + w * 2.0) * h;
  rolls := Ceil(area * 1.15 / 5.2);
  if not (rolls in [0..20]) then
    Result := IntToStr(rolls)
  else
    Result := numbers[rolls];
end;

end.
