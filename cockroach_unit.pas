{
8 kyu
Cockroach
https://www.codewars.com/kata/55fab1ffda3e2e44f00000c6
}

unit cockroach_unit;

{$mode objfpc}{$H+}

interface

function CockroachSpeed(s: real): integer;

implementation

function CockroachSpeed(s: real): integer;
begin
  Result {cm/sec} := Trunc(s {km/h} * 1e5 {cm/km} / 3.6e3 {sec/h});
end;

end.
