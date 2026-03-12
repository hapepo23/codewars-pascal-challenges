{
7 kyu
Going to the cinema
https://www.codewars.com/kata/562f91ff6a8b77dfe900006e
}

unit going_to_the_cinema_unit;

{$mode objfpc}{$H+}

interface

function Movie(card, ticket: int64; perc: double): int64;

implementation

uses
  Math;

function Movie(card, ticket: int64; perc: double): int64;
var
  cardTotal, noCardTotal, ticketWithCard: double;
begin
  cardTotal := card;
  noCardTotal := 0;
  Result := 0;
  ticketWithCard := ticket;
  repeat
    Result := Result + 1;
    noCardTotal := noCardTotal + ticket;
    ticketWithCard := ticketWithCard * perc;
    cardTotal := cardTotal + ticketWithCard;
  until ceil(cardTotal) < noCardTotal;
end;

end.
