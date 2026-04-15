{
6 kyu
Train your skills in creation of classes
https://www.codewars.com/kata/5ab4f002379d20e82500008c
}

program class_creation_skills;

{$mode objfpc}{$H+}

uses
  class_creation_skills_unit,
  SysUtils;

  procedure DoTest(Text: string; Actual: string; Expected: string);
  begin
    writeln('Test Case: ', Text);
    writeln('Expected : ', Expected);
    writeln('Actual   : ', Actual);
    if Expected = Actual then
      writeln('-> OK')
    else
      writeln('-> FAIL');
  end;

var
  x1, x2, x3, x4, x5: TX;
begin
  x1 := TX.Create;
  DoTest('x1 := TX.Create;', x1.ToString, '[1,2]');
  x2 := TX.Create(3);
  DoTest('x2 := TX.Create(3);', x2.ToString, '[3,2]');
  x3 := TX.Create(3, 4);
  DoTest('x3 := TX.Create(3,4);', x3.ToString, '[3,4]');
  x2.Add(x3);
  DoTest('x2.Add(x3);', x2.ToString, '[6,6]');
  x2.Inc;
  DoTest('x2.Inc;', x2.ToString, '[7,7]');
  x1.Dec;
  DoTest('x1.Dec;', x1.ToString, '[0,1]');
  x2.Inc(2);
  DoTest('x2.Inc(2);', x2.ToString, '[9,9]');
  x1.Dec(2);
  DoTest('x1.Dec(2);', x1.ToString, '[-2,-1]');
  x1.Subtract(x2);
  DoTest('x1.Subtract(x2);', x1.ToString, '[-11,-10]');
  x4 := TX.Create(x3); // copy constructor
  DoTest('x4 := TX.Create(x3); // copy constructor', x4.ToString, '[3,4]');
  DoTest('IntToStr(x2.GetA)', IntToStr(x2.GetA), '9');
  DoTest('IntToStr(x1.GetB)', IntToStr(x1.GetB), '-10');
  x3.Assign(x4); // assign x4 to x3
  DoTest('x3.Assign(x4); // assign x4 to x3', x3.ToString, '[3,4]');
  x1.Dec(17);
  DoTest('x1.Dec(17);', x1.ToString, '[-28,-27]');
  x5 := x2.CreateClone; // clone x2 to x5
  DoTest('x5 := x2.CreateClone; // clone x2 to x5', x5.ToString, '[9,9]');
  x5.Assign(0,0); // assign [0,0] to x5
  DoTest('x5.Assign(0,0); // assign [0,0] to x5', x5.ToString, '[0,0]');
  x3.SetA(-11);
  DoTest('x3.SetA(-11);', x3.ToString, '[-11,4]');
  x3.SetB(-99);
  DoTest('x3.SetB(-99);', x3.ToString, '[-11,-99]');
  x5.Free;
  x4.Free;
  x3.Free;
  x2.Free;
  x1.Free;
end.
