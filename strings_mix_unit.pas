{
4 kyu
Strings Mix
https://www.codewars.com/kata/5629db57620258aa9d000014
}

unit strings_mix_unit;

{$mode objfpc}{$H+}

interface

function Mix(s1, s2: string): string;

implementation

uses
  SysUtils,
  Generics.Collections,
  Generics.Defaults;

type
  TCountMatrix = array[1..2] of array['a'..'z'] of integer;
  TResultStrings = array['a'..'z'] of string;
  TStringComparer = specialize TComparer<string>;

function CreateResultString(c: char; Count: integer): string;
var
  i: integer;
begin
  Result := '';
  SetLength(Result, Count + 1);
  Result[1] := ':';
  for i := 1 to Count do
    Result[i + 1] := c;
end;

function Compare(constref L, R: string): integer;
var
  lenL, lenR: integer;
begin
  lenL := Length(L);
  lenR := Length(R);
  if lenL > lenR then
    Result := -1
  else if lenL < lenR then
    Result := 1
  else
    Result := CompareStr(L, R);
end;

function Mix(s1, s2: string): string;
var
  counts: TCountMatrix;
  results: TResultStrings;
  i: integer;
  c: char;
  found: boolean;
  s: string;
begin
  for i := 1 to 2 do
    for c := 'a' to 'z' do
      counts[i][c] := 0;
  for c in s1 do
    if c in ['a'..'z'] then
      counts[1][c] += 1;
  for c in s2 do
    if c in ['a'..'z'] then
      counts[2][c] += 1;
  found := False;
  for c := 'a' to 'z' do
  begin
    if (counts[1][c] > 1) or (counts[2][c] > 1) then
    begin
      i := 1;
      if counts[1][c] > counts[2][c] then
        results[c] := '1'
      else if counts[1][c] = counts[2][c] then
        results[c] := '='
      else
      begin
        results[c] := '2';
        i := 2;
      end;
      results[c] += CreateResultString(c, counts[i][c]);
      found := True;
    end
    else
      results[c] := '';
  end;
  Result := '';
  if found then
  begin
    specialize TArrayHelper<string>.Sort(results,
      TStringComparer.Construct(@Compare));
    for s in results do
      if s <> '' then
      begin
        if Result <> '' then
          Result += '/';
        Result += s;
      end;
  end;
end;

end.
