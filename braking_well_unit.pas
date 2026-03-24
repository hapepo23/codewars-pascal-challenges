{
6 kyu
Braking well
https://www.codewars.com/kata/565c0fa6e3a7d39dee000125
}

unit braking_well_unit;

{$mode objfpc}{$H+}

interface

function Dist(v, mu: double): double;
function Speed(d, mu: double): double;

implementation

const
  g_m_per_s2: double = 9.81;

function Dist(v, mu: double): double;
var
  v_m_per_s, dist_reaction_m, dist_braking_m: double;
begin
  { v in km per h, Friction coeff. mu dimensionless }
  v_m_per_s := v / 3.6;
  dist_reaction_m := v_m_per_s;  { suppose reaction time is 1 sec }
  dist_braking_m := 0.5 * v_m_per_s * v_m_per_s / (mu * g_m_per_s2);
  Result := dist_reaction_m + dist_braking_m;   { in m }
end;

function Speed(d, mu: double): double;
var
  a, b, c, v_m_per_s: double;
begin
  { d in m, Friction coeff. mu dimensionless }
  { a,b,c = coeff. of quadratic equation a*v**2 + b*v + c = 0 }
  a := 0.5 / (mu * g_m_per_s2);
  b := 1.0;
  c := -d;
  v_m_per_s := (-b + sqrt(b * b - 4.0 * a * c)) / (2.0 * a);
  Result := v_m_per_s * 3.6;   { in km/h }
end;

end.
