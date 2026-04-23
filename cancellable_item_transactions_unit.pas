{
6 kyu
Cancellable Item Transactions
https://www.codewars.com/kata/69bf57993a0061ef6d03c095
}

unit cancellable_item_transactions_unit;

{$mode objfpc}{$H+}

interface

function Calculate(price_dict, transaction: string): int64;

implementation

uses
  SysUtils,
  StrUtils,
  RegExpr;

type
  TAlphabet = 'A'..'Z';
  TPrices = array[TAlphabet] of int64;
  TStacks = array[TAlphabet] of array of int64;

function Calculate(price_dict, transaction: string): int64;
var
  re: TRegExpr;
  prices: TPrices;
  stacks: TStacks;
  price_data, price_item: array of string;
  s: string;
  c: TAlphabet;
  price, Count, total: int64;
begin
  Result := 0;
  for c in TAlphabet do
  begin
    prices[c] := 0;
    stacks[c] := [];
    SetLength(stacks[c], 0);
  end;
  price_data := SplitString(price_dict, ',');
  for s in price_data do
  begin
    price_item := SplitString(s, ':');
    if (Length(price_item) >= 2) and (price_item[0][1] >= 'A') and
      (price_item[0][1] <= 'Z') then
    begin
      c := price_item[0][1];
      prices[c] := StrToInt64(price_item[1]);
    end;
  end;
  re := TRegExpr.Create('([-]{0,1}[0-9]*)([A-Z]{1})');
  if re.Exec(transaction) then
    repeat
      c := re.Match[2][1];
      if re.Match[1] = '' then
      begin
        if Length(stacks[c]) > 0 then
        begin
          Result -= stacks[c][High(stacks[c])];
          SetLength(stacks[c], Length(stacks[c]) - 1);
        end;
      end
      else
      begin
        price := prices[c];
        Count := StrToInt64(re.Match[1]);
        total := Count * price;
        SetLength(stacks[c], Length(stacks[c]) + 1);
        stacks[c][High(stacks[c])] := total;
        Result += total;
      end;
    until not re.ExecNext;
  re.Free;
end;

end.
