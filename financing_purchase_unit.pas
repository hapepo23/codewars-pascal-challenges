{
6 kyu
Financing a purchase
https://www.codewars.com/kata/59c68ea2aeb2843e18000109
}

unit financing_purchase_unit;

{$mode objfpc}{$H+}

interface

function Amort(rate: double; bal, term, numPayments: int64): string;

implementation

uses
  SysUtils,
  Math;

function Amort(rate: double; bal, term, numPayments: int64): string;
var
  mrate, mpayment, curr_bal, interest, princ: double;
  m: int64;
begin
  mrate := rate / 1200.0;
  mpayment := mrate * bal / (1.0 - Power(1.0 + mrate, -term));
  curr_bal := bal;
  for m := 1 to numPayments do
  begin
    interest := mrate * curr_bal;
    princ := mpayment - interest;
    curr_bal := curr_bal - princ;
  end;
  Result := Format('num_payment %d c %.0f princ %.0f int %.0f balance %.0f',
    [numPayments, mpayment, princ, interest, curr_bal]);
end;

end.
