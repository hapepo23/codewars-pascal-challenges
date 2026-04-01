{
6 kyu
Ease the StockBroker
https://www.codewars.com/kata/54de3257f565801d96001200
}

program ease_the_stockbroker;

{$mode objfpc}{$H+}

uses
  ease_the_stockbroker_unit;

var
  s, st: string;

  procedure DoTest(strng: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := BalanceStatement(strng);
    writeln('Orders  : ', strng);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  st := 'GOOG 300 542.0 B,AAPL 50 145.0 B,CSCO 250.0 29 B,GOOG 200 580.0 S';
  s := 'Buy: 169850 Sell: 116000; Badly formed 1: CSCO 250.0 29 B ;';
  DoTest(st, s);
  st := 'ZNGA 1300 2.66 B,CLH15.NYM 50 56.32 B,OWW 1000 11.623 B,OGG 20 580.1 B';
  s := 'Buy: 29499 Sell: 0';
  DoTest(st, s);
  st := '';
  s := 'Buy: 0 Sell: 0';
  DoTest(st, s);
  st := 'ZYGN 24.0 55.5 B,CSCO 90 160.45 S,GOOG 100 5.5 C,CLH16.NYM 12 12.8 B' +
    LineEnding;
  s := 'Buy: 154 Sell: 14441; Badly formed 2: ZYGN 24.0 55.5 B ;GOOG 100 5.5 C ;';
  DoTest(st, s);
  st := 'BoAML 90 160.45 S,ZYGN 45 34.8 S,MYSPACE 15 45.5 P,JPMC 50 55.5 B,APPL 78 210 B';
  s := 'Buy: 2775 Sell: 16007; Badly formed 2: MYSPACE 15 45.5 P ;APPL 78 210 B ;';
  DoTest(st, s);
end.
