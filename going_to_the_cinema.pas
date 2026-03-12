{
7 kyu
Going to the cinema
https://www.codewars.com/kata/562f91ff6a8b77dfe900006e
}

program going_to_the_cinema;

{$mode objfpc}{$H+}

uses
  going_to_the_cinema_unit;

  procedure DoTest(card, ticket: int64; perc: double; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := Movie(card, ticket, perc);
    writeln('Card      : ', card);
    writeln('Ticket    : ', ticket);
    writeln('Percentage:', perc: 5: 2);
    writeln('Expected  : ', Expected);
    writeln('Actual    : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(500, 15, 0.9, 43);
  DoTest(100, 10, 0.95, 24);
  DoTest(600, 17, 0.95, 54);
  DoTest(900, 11, 0.84, 88);
  DoTest(700, 10, 0.93, 84);
  DoTest(700, 16, 0.84, 50);
end.
