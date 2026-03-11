{
7 kyu
Robinson Crusoe
https://www.codewars.com/kata/5d95b7644a336600271f52ba
}

program robinson_crusoe;

{$mode objfpc}{$H+}

uses
  robinson_crusoe_unit;

type
  TArr = array [0..1] of double;

var
  r: TArr;

  procedure DoTest(n: int64; d: double; ang: int64;
    distmult: double; angmult: double;
    Expected: TArr);
  var
    Actual: TArr;
  const
    eps: double = 1e-9;
  begin
    Actual := Crusoe(n, d, ang, distmult, angmult);
    writeln('n       : ', n);
    writeln('d       : ', d);
    writeln('ang     : ', ang);
    writeln('distmult: ', distmult);
    writeln('angmult : ', angmult);
    writeln('Expected: {', Expected[0], ', ', Expected[1], '}');
    writeln('Actual  : {', Actual[0], ', ', Actual[1], '}');
    if (Abs(Actual[0] - Expected[0]) <= eps) and
      (Abs(Actual[1] - Expected[1]) <= eps) then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  r[0] := 0.830673754438;
  r[1] := 0.620694691344;
  DoTest(5, 0.2, 30, 1.02, 1.1, r);
  r[0] := 1.814652098870;
  r[1] := 0.164646220964;
  DoTest(8, 0.22, 3, 1.01, 1.15, r);
  r[0] := 0.318341393410;
  r[1] := 2.292862212314;
  DoTest(29, 0.13, 21, 1.01, 1.09, r);
  r[0] := 2.689897523779;
  r[1] := 2.477953232467;
  DoTest(45, 0.10, 3, 1.01, 1.10, r);
end.
