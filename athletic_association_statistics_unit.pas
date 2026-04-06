{
6 kyu
Statistics for an Athletic Association
https://www.codewars.com/kata/55b3425df71c1201a800009c
}

unit athletic_association_statistics_unit;

{$mode objfpc}{$H+}

interface

function Stat(s: string): string;

implementation

uses
  Generics.Collections,
  StrUtils,
  SysUtils;

function HMStoSec(hms: string): integer;
var
  slist: array of string;
  nlist: array of integer = nil;
  i: integer;
begin
  hms := Trim(hms);
  slist := SplitString(hms, '|');
  SetLength(nlist, Length(slist));
  for i := 0 to High(slist) do
    nlist[i] := StrToInt(slist[i]);
  Result := nlist[2] + 60 * (nlist[1] + 60 * nlist[0]);
end;

function SectoHMS(sec: integer): string;
var
  h, m, s, r: integer;
begin
  h := sec div 3600;
  r := sec - 3600 * h;
  m := r div 60;
  s := r - m * 60;
  Result := Format('%.02d|%.02d|%.02d', [h, m, s]);
end;

function Stat(s: string): string;
var
  list: array of string;
  secs: array of integer = nil;
  i, l, range, average, median: integer;
begin
  if s = '' then
    Exit('');
  list := SplitString(s, ',');
  l := Length(list);
  SetLength(secs, l);
  average := 0;
  for i := 0 to l - 1 do
  begin
    secs[i] := HMStoSec(list[i]);
    average += secs[i];
  end;
  average := average div l;
  specialize TArrayHelper<integer>.Sort(secs);
  range := secs[l - 1] - secs[0];
  if Odd(l) then
    median := secs[(l - 1) div 2]
  else
    median := (secs[(l - 1) div 2] + secs[((l - 1)) div 2 + 1]) div 2;
  Result := Format('Range: %s Average: %s Median: %s',
    [SectoHMS(range), SectoHMS(average), SectoHMS(median)]);
end;

end.
