{
6 kyu
Floating-point Approximation (II)
https://www.codewars.com/kata/581ee0db1bbdd04e010002fd
}

program floating_point_approx_2;

{$mode objfpc}{$H+}

uses
  floating_point_approx_2_unit,
  SysUtils;

type
  TDoubleArray = array of double;
  TFunctionParameter = function(s: double): double;

  function ArrayToString(A: TDoubleArray): string;
  var
    i: int64;
    res: string;
  begin
    res := '[';
    for i := 0 to High(A) do
    begin
      res += Format('%.2f, ', [A[i]]);
    end;
    if (res = '[') then
      Result := '[]'
    else
      Result := Copy(res, 1, Length(res) - 2) + ']';
  end;

  function Id(x: double): double; inline;
  begin
    Result := x;
  end;

  function Sn(x: double): double; inline;
  begin
    Result := sin(x);
  end;

  function Cs(x: double): double; inline;
  begin
    Result := cos(x);
  end;

  procedure DoTest(fname: string; f: TFunctionParameter; l, u: double;
    n: int64; Expected: string);
  var
    Actual: TDoubleArray;
    ActualStr: string;
  begin
    Actual := Interp(f, l, u, n);
    ActualStr := ArrayToString(Actual);
    writeln('Function: ', fname);
    writeln('l       : ', l: 8: 2);
    writeln('u       : ', u: 8: 2);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', ActualStr);
    if Expected = ActualStr then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('Identity', @Id, 0, 15.0, 9,
    '[0.00, 1.66, 3.33, 5.00, 6.66, 8.33, 10.00, 11.66, 13.33]');
  DoTest('Identity', @Id, 0, 15.0, 9,
    '[0.00, 1.66, 3.33, 5.00, 6.66, 8.33, 10.00, 11.66, 13.33]');
  DoTest('Sinus', @Sn, 0, 18.0, 12,
    '[0.00, 0.99, 0.14, -0.98, -0.28, 0.93, 0.41, -0.88, -0.54, 0.80, 0.65, -0.72]');
  DoTest('Sinus', @Sn, 0, 21.0, 10,
    '[0.00, 0.86, -0.88, 0.01, 0.85, -0.88, 0.03, 0.84, -0.89, 0.05]');
  DoTest('Cosinus', @Cs, 0, 21.0, 7, '[1.00, -0.99, 0.96, -0.92, 0.84, -0.76, 0.66]');
  DoTest('Cosinus', @Cs, 0, 12.0, 5, '[1.00, -0.74, 0.08, 0.60, -0.99]');
end.
