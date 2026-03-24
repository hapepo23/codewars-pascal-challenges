{
6 kyu
Easy Balance Checking
https://www.codewars.com/kata/59d727d40e8c9dd2dd00009f
}

program easy_balance_checking;

{$mode objfpc}{$H+}

uses
  easy_balance_checking_unit,
  StrUtils;

var
  s, sol: string;

  procedure DoTest(book: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := Balance(book);
    writeln('Book:' + LineEnding + '----------' + LineEnding +
      ReplaceStr(book, '\n', #10) + LineEnding + '----------');
    writeln('Expected:' + LineEnding + '----------' + LineEnding +
      ReplaceStr(Expected, '\n', #10) + LineEnding + '----------');
    writeln('Actual:' + LineEnding + '----------' + LineEnding +
      ReplaceStr(Actual, '\n', #10) + LineEnding + '----------');
    if Expected = Actual then
      writeln('-> OK')
    else
      writeln('-> FAIL');
    writeln('==================================');
  end;

begin
  s := '1000.00!=\n125 Market !=:125.45\n126 Hardware =34.95\n127 Video! 7.45\n128 Book   :14.32\n129 Gasoline ::16.10';
  sol := 'Original Balance: 1000.00\n125 Market 125.45 Balance 874.55\n126 Hardware 34.95 Balance 839.60\n127 Video 7.45 Balance 832.15\n128 Book 14.32 Balance 817.83\n129 Gasoline 16.10 Balance 801.73\nTotal expense  198.27\nAverage expense  39.65';
  DoTest(s, sol);
  s := '1233.00\n125 Hardware;! 24.80?\n123 Flowers 93.50;\n127 Meat 120.90\n120 Picture 34.00\n124 Gasoline 11.00\n' + '123 Photos;! 71.40?\n122 Picture 93.50\n132 Tyres;! 19.00,?;\n129 Stamps; 13.60\n129 Fruits 17.60\n129 Market;! 128.00?\n121 Gasoline;! 13.60?';
  sol := 'Original Balance: 1233.00\n125 Hardware 24.80 Balance 1208.20\n123 Flowers 93.50 Balance 1114.70\n127 Meat 120.90 Balance 993.80\n120 Picture 34.00 Balance 959.80\n124 Gasoline 11.00 Balance 948.80\n123 Photos 71.40 Balance 877.40\n122 Picture 93.50 Balance 783.90\n132 Tyres 19.00 Balance 764.90\n129 Stamps 13.60 Balance 751.30\n129 Fruits 17.60 Balance 733.70\n129 Market 128.00 Balance 605.70\n121 Gasoline 13.60 Balance 592.10\nTotal expense  640.90\nAverage expense  53.41';
  DoTest(s, sol);
  s := '1242.00\n122 Hardware;! 13.60\n***\n127 Hairdresser 13.10\n123 Fruits 93.50?;\n132 Stamps;! 13.60?;\n160 Pen;! 17.60?;\n002 Car;! 34.00\n';
  sol := 'Original Balance: 1242.00\n122 Hardware 13.60 Balance 1228.40\n127 Hairdresser 13.10 Balance 1215.30\n123 Fruits 93.50 Balance 1121.80\n132 Stamps 13.60 Balance 1108.20\n160 Pen 17.60 Balance 1090.60\n002 Car 34.00 Balance 1056.60\nTotal expense  185.40\nAverage expense  30.90';
  DoTest(s, sol);
  s := '1242.00\n+++\n####\n\n!!!\n';
  sol := 'Original Balance: 1242.00\nTotal expense  0.00\nAverage expense  0.00';
  DoTest(s, sol);
end.
