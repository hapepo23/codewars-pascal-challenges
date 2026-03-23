{
6 kyu
Binaries
https://www.codewars.com/kata/5d98b6b38b0f6c001a461198
}

unit binaries_unit;

{$mode objfpc}{$H+}

interface

function Code(str: string): string;
function Decode(str: string): string;

implementation

uses
  SysUtils;

const
  encode_tab: array[0..9] of string = (
    '10', '11', '0110', '0111', '001100',
    '001101', '001110', '001111', '00011000', '00011001'
    );
  delta: integer = 48;

function Code(str: string): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to Length(str) do
    Result := Result + encode_tab[Ord(str[i]) - delta];
end;

function Decode(str: string): string;
var
  pos, l, prefixlen: integer;
  s: string;
begin
  Result := '';
  l := Length(str);
  pos := 1;
  while pos <= l do
  begin
    prefixlen := 0;
    while str[pos] = '0' do
    begin
      Inc(pos);
      Inc(prefixlen);
    end;
    Inc(pos);
    Inc(prefixlen);
    s := Copy(str, pos, prefixlen);
    Result := Result + Chr(delta + StrToInt('%' + s));
    pos := pos + prefixlen;
  end;
end;

end.
