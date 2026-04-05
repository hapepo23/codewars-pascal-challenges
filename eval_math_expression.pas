{
2 kyu
Evaluate mathematical expression
https://www.codewars.com/kata/52a78825cdfc2cfc87000005
}

program eval_math_expression;

{$mode objfpc}{$H+}

uses
  SysUtils,
  Math,
  eval_math_expression_unit;

  procedure DoTest(expression: string; expected: double);
  var
    actual: double;
  begin
    actual := Calc(expression);
    writeln('Expression: ', expression);
    writeln('Expected  : ', Format('%.15g', [expected]));
    writeln('Actual    : ', Format('%.15g', [actual]));
    if not IsNaN(expected) then
    begin
      if (Abs(expected - actual) < 1e-10) then
        writeln('-> OK', LineEnding)
      else
        writeln('-> FAIL', LineEnding);
    end
    else
    begin
      if IsNaN(actual) then
        writeln('-> OK', LineEnding)
      else
        writeln('-> FAIL', LineEnding);
    end;
  end;

begin
  DoTest('12*-1', -12.0);
  DoTest('1+1', 2.0);
  DoTest('1 - 1', 0.0);
  DoTest('1* 1', 1.0);
  DoTest('1 /1', 1.0);
  DoTest('-123', -123.0);
  DoTest('123', 123.0);
  DoTest('12* 123', 1476.0);
  DoTest('2 /2+3 * 4.75- -6', 21.25);
  DoTest('2 / (2 + 3) * 4.33 - -6', 7.732);
  DoTest('((2 / (2 + 3) * 4.33 - -6))', 7.732);
  DoTest('(( -2.74/8.15)-9.62+6.76/ -9.31/ -2.40)', -9.65365424955904139);
  DoTest(
    '(((((7.54+6.67+6.43/ -9.52/6.50+ ' +
    '-8.91/9.65+8.01+8.68/7.86-6.28/9.74*8.85)+7.77-9.41/6.40)- -6.11+5.54+ ' +
    '-8.96)+9.49-9.38*9.03))', -49.6307738217889352);
  DoTest(
    '(((7.54+6.67+6.43/ -9.52/6.50+ ' +
    '-8.91/9.65+8.01+8.68/7.86-6.28/9.74*8.85)+7.77-9.41/6.40- -6.11+5.54+ ' +
    '-8.96+9.49-9.38*9.03+ -7.99-7.22/(9.83)/(8.15/9.62+6.76/ -9.31/ ' +
    '-2.40/6.90+7.12* -0.30+ -9.26/ -6.08+ -8.02/9.03)-( -5.70* ' +
    '-0.07+9.16+7.31/7.03-6.93- -7.58+7.79)+5.90/5.43/6.67/8.94/8.40-7.97*( ' +
    '-2.14* -8.97+ -2.21+ ' +
    '-7.30)/(6.38*8.22/7.88)+(9.46)*7.88-7.05-7.87*9.09/(6.44/7.82+ ' +
    '-8.09*8.89-7.89+10.00-8.30+(9.26/7.14*6.74+6.60+8.95))))', -18.2080130852886874);
  DoTest('(12* 123/(5 -2))', 492.0);
  DoTest('(12* 123/-(-5 + 2))', 492.0);
  DoTest('(((80 - (19))))', 61.0);
  DoTest('5.26*8.07+7.74- -5.04-(9.66)-(5.46)', 40.1082000000000036);
  DoTest('(1 - 2) + -(-(-(-4)))', 3.0);
  DoTest('(12* 123/(5..5-2))', NaN);
end.
