{
6 kyu
Magnitude
https://www.codewars.com/kata/5cc70653658d6f002ab170b5
}

unit magnitude_unit;

{$mode objfpc}{$H+}

interface

type
  TArray3 = array [0..2] of int64;

const
  noModulus: TArray3 = (-1, -1, 1);

function SqrModulus(z: string): TArray3;

implementation

uses
  SysUtils;

function SortIntegerDesc(num: integer): integer;
var
  str: string;
  temp: char;
  size, i, j: integer;
begin
  str := IntToStr(num);
  size := Length(str);
  for i := 1 to size - 1 do
    for j := i + 1 to size do
      if str[i] < str[j] then
      begin
        temp := str[i];
        str[i] := str[j];
        str[j] := temp;
      end;
  Result := StrToInt(str);
end;

function SqrModulus(z: string): TArray3;
var
  Data: array of string;
  ldata, i, a, b: integer;
  polar: boolean;
begin
  Data := z.Split(' ');
  ldata := Length(Data);
  if (ldata < 3) or (not Odd(ldata)) or ((Data[0] <> 'polar') and
    (Data[0] <> 'cart')) then
    Exit(noModulus);
  polar := (Data[0] = 'polar');
  i := 1;
  Result[1] := 0;
  while i < ldata do
  begin
    try
      a := StrToInt(Data[i]);
      b := StrToInt(Data[i + 1]);
    except
      On E: EConvertError do
        Exit(noModulus);
    end;
    if polar then
      Result[1] += Sqr(a)
    else
      Result[1] += Sqr(a) + Sqr(b);
    Inc(i, 2);
  end;
  Result[0] := 1;
  Result[2] := SortIntegerDesc(Result[1]);
end;

end.
