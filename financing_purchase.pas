{
6 kyu
Financing a purchase
https://www.codewars.com/kata/59c68ea2aeb2843e18000109
}

program financing_purchase;

{$mode objfpc}{$H+}

uses
  SysUtils,
  financing_purchase_unit;

  procedure DoTest(rate: double; bal, term, numPayments: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := Amort(rate, bal, term, numPayments);
    writeln('Annual rate, % : ', Format('%.4g', [rate]));
    writeln('Amount borrowed: ', bal);
    writeln('Term in months : ', term);
    writeln('Payment number : ', numPayments);
    writeln('Expected       : ', Expected);
    writeln('Actual         : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(7.4, 10215, 24, 20, 'num_payment 20 c 459 princ 445 int 14 balance 1809');
  DoTest(7.9, 107090, 48, 41, 'num_payment 41 c 2609 princ 2476 int 133 balance 17794');
  DoTest(6.8, 105097, 36, 4, 'num_payment 4 c 3235 princ 2685 int 550 balance 94447');
  DoTest(3.8, 48603, 24, 10, 'num_payment 10 c 2106 princ 2009 int 98 balance 28799');
  DoTest(1.9, 182840, 48, 18, 'num_payment 18 c 3959 princ 3769 int 189 balance 115897');
  DoTest(6, 100000, 360, 1, 'num_payment 1 c 600 princ 100 int 500 balance 99900');
  DoTest(6, 100000, 360, 12, 'num_payment 12 c 600 princ 105 int 494 balance 98772');
end.
