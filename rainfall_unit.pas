{
6 kyu
Rainfall
https://www.codewars.com/kata/56a32dd6e4f4748cc3000006
}

unit rainfall_unit;

{$mode objfpc}{$H+}

interface

function Mean(town, s: string): double;
function Variance(town, s: string): double;

implementation

uses
  SysUtils,
  StrUtils,
  RegExpr;

type
  TCalcMeanVarResult = array[1..2] of double;
  TStrArray = array of string;

function CalcMeanVar(town, s: string): TCalcMeanVarResult;
const
  re_s: string = '^([^:]+):Jan\s+([.0-9]+),Feb\s+([.0-9]+),Mar\s+([.0-9]+)' +
    ',Apr\s+([.0-9]+),May\s+([.0-9]+),Jun\s+([.0-9]+),Jul\s+([.0-9]+)' +
    ',Aug\s+([.0-9]+),Sep\s+([.0-9]+),Oct\s+([.0-9]+),Nov\s+([.0-9]+)' +
    ',Dec\s+([.0-9]+)$';
var
  Lines: TStrArray;
  re: TRegExpr;
  Data: array[1..12] of double;
  i, j: integer;
  found: boolean;
begin
  re := TRegExpr.Create(re_s);
  Lines := SplitString(s, LineEnding);
  found := False;
  for i := 0 to High(Lines) do
  begin
    if re.Exec(Lines[i]) and (re.SubExprMatchCount = 13) and
      (re.Match[1] = town) then
    begin
      for j := 1 to 12 do
        Data[j] := StrToFloat(re.Match[j + 1]);
      found := True;
      Break;
    end;
  end;
  Result[1] := -1;
  Result[2] := -1;
  re.Free;
  Lines := nil;
  if found then
  begin
    Result[1] := 0;
    Result[2] := 0;
    for j := 1 to 12 do
      Result[1] := Result[1] + Data[j];
    Result[1] := Result[1] / 12.0;
    for j := 1 to 12 do
      Result[2] := Result[2] + Sqr(Data[j] - Result[1]);
    Result[2] := Result[2] / 12.0;
  end;
end;

function Mean(town, s: string): double;
var
  r: TCalcMeanVarResult;
begin
  r := CalcMeanVar(town, s);
  Result := r[1];
end;

function Variance(town, s: string): double;
var
  r: TCalcMeanVarResult;
begin
  r := CalcMeanVar(town, s);
  Result := r[2];
end;

end.
