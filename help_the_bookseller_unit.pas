{
6 kyu
Help the bookseller !
https://www.codewars.com/kata/54dc6f5a224c26032800005c
}

unit help_the_bookseller_unit;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

function StockSummary(lstOfArt, lstOf1stLetter: TStringArray): string;

implementation

function StockSummary(lstOfArt, lstOf1stLetter: TStringArray): string;
var
  item: string;
  catsums: array['A'..'Z'] of int64;
  c: char;
begin
  if (Length(lstOfArt) = 0) or (Length(lstOf1stLetter) = 0) then
    Exit('');
  for c := 'A' to 'Z' do
    catsums[c] := 0;
  for item in lstOfArt do
    catsums[item[1]] := catsums[item[1]] + StrToInt(Copy(item, Pos(' ', item) + 1));
  Result := '';
  for item in lstOf1stLetter do
    Result := Result + '(' + item + ' : ' + IntToStr(catsums[item[1]]) + ') - ';
  Result := Copy(Result, 1, Length(Result) - 3);
end;

end.
