{
6 kyu
Hidden "Cubic" numbers
https://www.codewars.com/kata/55031bba8cba40ada90011c4
}

unit hidden_cubic_numbers_unit;

{$mode objfpc}{$H+}

interface

function IsSumOfCubes(s: string): string;

implementation

uses
  SysUtils,
  RegExpr;

function CheckCubic(num: integer): boolean;
var
  n, sum, digit: integer;
begin
  n := num;
  sum := 0;
  while (n <> 0) do
  begin
    digit := n mod 10;
    sum += digit * digit * digit;
    n := n div 10;
  end;
  Result := (sum = num);
end;

function IsSumOfCubes(s: string): string;
var
  re: TRegExpr;
  sum, num: integer;
begin
  Result := '';
  if s <> '' then
  begin
    sum := 0;
    re := TRegExpr.Create('\d{1,3}');
    if re.Exec(s) then
      repeat
        num := StrToInt(re.Match[0]);
        if CheckCubic(num) then
        begin
          sum += num;
          Result += IntToStr(num) + ' ';
        end;
      until not re.ExecNext;
    re.Free;
  end;
  if Result = '' then
    Result := 'Unlucky'
  else
    Result += IntToStr(sum) + ' Lucky';
end;

end.
