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

function BalanceStatement(strng: string): string;
const
  res: string = '^([^\s]+)\s+(\d+)\s+(\d+\.\d+)\s+([SB])$';
var
  parts: TStringArray;
  i, errcnt, q: integer;
  re: TRegExpr;
  errstr: string;
  buysum, sellsum, price, prod: double;
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
      q := StrToInt(re.Match[2]);
      price := StrToFloat(re.Match[3]);
      prod := q * price;
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
  Result := Format('Buy: %.0f Sell: %.0f', [buysum, sellsum]);
  if errcnt > 0 then
    Result += Format('; Badly formed %d: %s', [errcnt, errstr]);
end;

end.
