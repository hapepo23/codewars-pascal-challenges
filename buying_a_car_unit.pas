{
6 kyu
Buying a car
https://www.codewars.com/kata/554a44516729e4d80b000012
}

unit buying_a_car_unit;

{$mode objfpc}{$H+}

interface

function nbMonths(startPriceOld, startPriceNew, savingperMonth: int64;
  percentLossByMonth: double): string;

implementation

uses
  SysUtils;

function nbMonths(startPriceOld, startPriceNew, savingperMonth: int64;
  percentLossByMonth: double): string;
var
  oldPrice, newPrice, savRate, savings, currLossPerc, balance: double;
  month: integer;
begin
  oldPrice := startPriceOld;
  newPrice := startPriceNew;
  savRate := savingperMonth;
  savings := 0.0;
  balance := oldPrice + savings - newPrice;
  currLossPerc := percentLossByMonth;
  month := 0;
  while balance < 0.0 do
  begin
    month := month + 1;
    if month mod 2 = 0 then
      currLossPerc := currLossPerc + 0.5;
    oldPrice := oldPrice * (100.0 - currLossPerc) / 100.0;
    newPrice := newPrice * (100.0 - currLossPerc) / 100.0;
    savings := savings + savingperMonth;
    balance := oldPrice + savings - newPrice;
  end;
  Result := IntToStr(month) + ' ' + IntToStr(Round(balance));
end;

end.
