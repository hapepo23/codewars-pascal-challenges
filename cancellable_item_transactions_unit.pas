{
6 kyu
Cancellable Item Transactions
https://www.codewars.com/kata/69bf57993a0061ef6d03c095
}

unit cancellable_item_transactions_unit;

{$mode objfpc}{$H+}

interface

uses
  Generics.Collections;

type
  TAlphabet = 'A'..'Z';
  TPriceDict = specialize TDictionary<TAlphabet, int64>;

function Calculate(price_dict: TPriceDict; transaction: string): int64;

implementation

uses
  SysUtils,
  RegExpr;

type
  TStacks = array[TAlphabet] of array of int64;

function Calculate(price_dict: TPriceDict; transaction: string): int64;
var
  re: TRegExpr;
  stacks: TStacks;
  c: TAlphabet;
  price, Count, total: int64;
begin
  Result := 0;
  for c in TAlphabet do
  begin
    stacks[c] := [];
    SetLength(stacks[c], 0);
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
        price := 0;
        if price_dict.ContainsKey(c) then
          price := price_dict[c];
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
