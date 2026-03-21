{
5 kyu
Some Egyptian fractions
https://www.codewars.com/kata/54f8693ea58bce689100065f
}

program some_egyptian_fractions;

{$mode objfpc}{$H+}

uses
  some_egyptian_fractions_unit;

  procedure DoTest(nrStr, drStr: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := Decompose(nrStr, drStr);
    writeln('Numerator  : ', nrStr);
    writeln('Denominator: ', drStr);
    writeln('Expected   : ', Expected);
    writeln('Actual     : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('3', '4', '[1/2, 1/4]');
  DoTest('12', '4', '[3]');
  DoTest('4', '5', '[1/2, 1/4, 1/20]');
  DoTest('21', '23', '[1/2, 1/3, 1/13, 1/359, 1/644046]');
  DoTest('0', '2', '[]');
  DoTest('66', '100', '[1/2, 1/7, 1/59, 1/5163, 1/53307975]');
  DoTest('22', '23', '[1/2, 1/3, 1/9, 1/83, 1/34362]');
  DoTest('1001', '3456', '[1/4, 1/26, 1/848, 1/2381184]');
  DoTest('16', '17', '[1/2, 1/3, 1/10, 1/128, 1/32640]');
  DoTest('30', '45', '[1/2, 1/6]');
  DoTest('125', '100', '[1, 1/4]');
  DoTest('75', '3', '[25]');
  DoTest('2', '8', '[1/4]');
  DoTest('9', '10', '[1/2, 1/3, 1/15]');
  DoTest('5', '6', '[1/2, 1/3]');
  DoTest('81', '82', '[1/2, 1/3, 1/7, 1/87, 1/8323]');
  DoTest('45', '30', '[1, 1/2]');
  DoTest('13', '12', '[1, 1/12]');
  DoTest('134', '162', '[1/2, 1/4, 1/13, 1/4212]');
  DoTest('1340', '1620', '[1/2, 1/4, 1/13, 1/4212]');
  DoTest('14', '15', '[1/2, 1/3, 1/10]');
  DoTest('50', '4187', '[1/84, 1/27055, 1/1359351420]');
  DoTest('40', '35', '[1, 1/7]');
  DoTest('7', '35', '[1/5]');
  DoTest('75', '75', '[1]');
  DoTest('989', '1000', '[1/2, 1/3, 1/7, 1/79, 1/6610, 1/99690819, 1/12146761380509000]');
  DoTest('681', '10000', '[1/15, 1/698, 1/1495715, 1/3132027210000]');
  DoTest('33', '16', '[2, 1/16]');
  DoTest('24', '14', '[1, 1/2, 1/5, 1/70]');
  DoTest('30', '15', '[2]');
  DoTest('34', '5', '[6, 1/2, 1/4, 1/20]');
  DoTest('33', '30', '[1, 1/10]');
  DoTest('22', '22', '[1]');
  DoTest('16', '25', '[1/2, 1/8, 1/67, 1/13400]');
  DoTest('26', '1', '[26]');
  DoTest('22', '13', '[1, 1/2, 1/6, 1/39]');
  DoTest('10', '1', '[10]');
  DoTest('15', '29', '[1/2, 1/58]');
  DoTest('6', '8', '[1/2, 1/4]');
  DoTest('12', '33', '[1/3, 1/33]');
  DoTest('9', '22', '[1/3, 1/14, 1/231]');
  DoTest('9', '34', '[1/4, 1/68]');
end.
