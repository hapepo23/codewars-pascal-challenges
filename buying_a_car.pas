{
6 kyu
Buying a car
https://www.codewars.com/kata/554a44516729e4d80b000012
}

program buying_a_car;

{$mode objfpc}{$H+}

uses
  buying_a_car_unit;

  procedure DoTest(startPriceOld, startPriceNew, savingperMonth: int64;
    percentLossByMonth: double; Expected: string);
  var
    Actual: string;
  begin
    Actual := nbMonths(startPriceOld, startPriceNew, savingperMonth, percentLossByMonth);
    writeln('Start Price old car: ', startPriceOld);
    writeln('Start Price new car: ', startPriceNew);
    writeln('Saving per Month   : ', savingperMonth);
    writeln('% Loss per Month   : ', percentLossByMonth: 4: 2);
    writeln('Expected           : "', Expected, '"');
    writeln('Actual             : "', Actual, '"');
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(2000, 8000, 1000, 1.5, '6 766');
  DoTest(12000, 8000, 1000, 1.5, '0 4000');
  DoTest(8000, 12000, 500, 1.0, '8 597');
end.
