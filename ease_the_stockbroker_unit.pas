{
6 kyu
Ease the StockBroker
https://www.codewars.com/kata/54de3257f565801d96001200
}

unit ease_the_stockbroker_unit;

{$mode objfpc}{$H+}

interface

function BalanceStatement(strng: string): string;

implementation

uses
  SysUtils,
  RegExpr;

function MyRound(x: double): string;
begin
  Result := Format('%.1f', [x]);
  if RightStr(Result, 1) >= '5' then
    Result := IntToStr(1 + StrToInt(LeftStr(Result, Length(Result) - 2)))
  else
    Result := LeftStr(Result, Length(Result) - 2);
end;

function BalanceStatement(strng: string): string;
const
  res: string = '^([^\s]+)\s+(\d+)\s+(\d+\.\d+)\s+([SB])$';
var
  parts: TStringArray;
  i, errcnt: integer;
  re: TRegExpr;
  errstr: string;
  buysum, sellsum, prod: double;
begin
  if strng = '' then
    Exit('Buy: 0 Sell: 0');
  parts := strng.Split(',');
  errcnt := 0;
  errstr := '';
  buysum := 0.0;
  sellsum := 0.0;
  re := TRegExpr.Create(res);
  for i := Low(parts) to High(parts) do
  begin
    parts[i] := Trim(parts[i]);
    if re.Exec(parts[i]) and (re.SubExprMatchCount = 4) then
    begin
      prod := StrToFloat(re.Match[2]) * StrToFloat(re.Match[3]);
      if re.Match[4] = 'B' then
        buysum += prod
      else
        sellsum += prod;
    end
    else
    begin
      errcnt += 1;
      errstr += parts[i] + ' ;';
    end;
  end;
  re.Free;
  Result := Format('Buy: %s Sell: %s', [MyRound(buysum), MyRound(sellsum)]);
  if errcnt > 0 then
    Result += Format('; Badly formed %d: %s', [errcnt, errstr]);
end;

end.
