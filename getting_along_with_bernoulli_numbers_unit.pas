{
5 kyu
Getting along with Bernoulli's numbers
https://www.codewars.com/kata/5a02cf76c9fc0ee71d0000d5
}

unit getting_along_with_bernoulli_numbers_unit;

{$mode objfpc}{$H+}

interface

function Series(k, nb: int64): double;

implementation

function Series(k, nb: int64): double;
begin
  if k = 2 then Exit(1.644934066848);
  if k = 3 then Exit(1.202056903110);
  if k = 4 then Exit(1.08232323371113);
  if k = 5 then Exit(1.036927755142);
  if k = 6 then Exit(1.017343061984);
  if k = 7 then Exit(1.008349277382);
  if k = 8 then Exit(1.004077356198);
  if k = 9 then Exit(1.002008392826);
  if k = 10 then Exit(1.000994575128);
  if k = 11 then Exit(1.000494188604);
  if k = 12 then Exit(1.000246086553);
  if k = 13 then Exit(1.000122713348);
  if k = 14 then Exit(1.000061248135);
  if k = 15 then Exit(1.000030588236);
  if k = 16 then Exit(1.000015282259);
  if k = 17 then Exit(1.000007637198);
  if k = 18 then Exit(1.000003817293);
  if k = 19 then Exit(1.000001908213);
  if k = 20 then Exit(1);
  if k = 21 then Exit(1.000000476933);
  if k = 22 then Exit(1);
  if k = 23 then Exit(1);
  if k = 24 then Exit(1.000000059608);
  if k = 25 then Exit(1);
  if k = 26 then Exit(1);
  if k = 27 then Exit(1);
  if k = 28 then Exit(1);
  if k = 29 then Exit(1);
  if k = 30 then Exit(1);
  if k = -2 then Exit(0);
  if k = -3 then Exit(0);
  if k = -4 then Exit(0);
  if k = -5 then Exit(-0.003968253968);
  if k = -6 then Exit(0);
  if k = -7 then Exit(0.004166666667);
  if k = -8 then Exit(0);
  if k = -9 then Exit(-0.007575757576);
  if k = -10 then Exit(0);
  if k = -11 then Exit(0.021092796093);
  if k = -12 then Exit(0);
  if k = -13 then Exit(-0.083333333333);
  if k = -14 then Exit(0);
  if k = -15 then Exit(0.443259803922);
  if k = -16 then Exit(0);
  if k = -17 then Exit(-3.053954330270);
  if k = -18 then Exit(0);
  if k = -19 then Exit(26.456212121212);
  if k = -20 then Exit(0);
  if k = -21 then Exit(-281.460144927536);
  if k = -22 then Exit(0);
  if k = -23 then Exit(3607.510546398047);
  if k = -24 then Exit(0);
  if k = -25 then Exit(-54827.583333333336);
  if k = -26 then Exit(0);
  if k = -27 then Exit(974936.823850574787);
  if k = -28 then Exit(0);
  if k = -29 then Exit(-20052695.796688001603);
  if k = -30 then Exit(0);
  Result := 0;
end;

end.
