{
6 kyu
Sums of Parts
https://www.codewars.com/kata/5ce399e0047a45001c853c2b
}

program sum_of_parts;

{$mode objfpc}{$H+}

uses
  SysUtils,
  sum_of_parts_unit;

  function ArrayToString(A: IntegerArray): string;
  var
    i: int64;
    res: string;
  begin
    res := '[';
    for i := 0 to High(A) do
      res += IntToStr(A[i]) + ', ';
    if (res = '[') then
      Result := '[]'
    else
      Result := Copy(res, 1, Length(res) - 2) + ']';
  end;

  procedure DoTest(ls: IntegerArray; Expected: IntegerArray);
  var
    Actual: IntegerArray;
    ExpStr, ActStr: string;
  begin
    Actual := PartsSums(ls);
    ActStr := ArrayToString(Actual);
    ExpStr := ArrayToString(Expected);
    writeln('Array ls: ', ArrayToString(ls));
    writeln('Expected: ', ExpStr);
    writeln('Actual  : ', ActStr);
    if ExpStr = ActStr then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest([0, 1, 3, 6, 10], [20, 20, 19, 16, 10, 0]);
  DoTest([1, 2, 3, 4, 5, 6], [21, 20, 18, 15, 11, 6, 0]);
  DoTest([744125, 935, 407, 454, 430, 90, 144, 6710213, 889, 810, 2579358],
    [10037855, 9293730, 9292795, 9292388, 9291934, 9291504, 9291414,
    9291270, 2581057, 2580168, 2579358, 0]);
  DoTest([30350, 76431, 156228, 78043, 98977, 80169, 32457, 182875,
    162323, 17508, 57971, 171907],
    [1145239, 1114889, 1038458, 882230, 804187, 705210, 625041,
    592584, 409709, 247386, 229878, 171907, 0]);
  DoTest([158077, 143494, 196531, 26272, 35656, 68756, 109861, 36958,
    83895, 134127, 81618, 193758, 143422],
    [1412425, 1254348, 1110854, 914323, 888051, 852395, 783639,
    673778, 636820, 552925, 418798, 337180, 143422, 0]);
end.
