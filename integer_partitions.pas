{
4 kyu
Getting along with Integer Partitions
https://www.codewars.com/kata/55cf3b567fc0e02b0b00000b
}

program integer_partitions;

{$mode objfpc}{$H+}

uses
  integer_partitions_unit;

  procedure DoTest(n: int64; Expected: string);
  var
    Actual: string;
  begin
    Actual := Part(n);
    writeln('n       : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 'Range: 0 Average: 1.00 Median: 1.00');
  DoTest(2, 'Range: 1 Average: 1.50 Median: 1.50');
  DoTest(3, 'Range: 2 Average: 2.00 Median: 2.00');
  DoTest(4, 'Range: 3 Average: 2.50 Median: 2.50');
  DoTest(5, 'Range: 5 Average: 3.50 Median: 3.50');
  DoTest(6, 'Range: 8 Average: 4.75 Median: 4.50');
  DoTest(7, 'Range: 11 Average: 6.09 Median: 6.00');
  DoTest(8, 'Range: 17 Average: 8.29 Median: 7.50');
  DoTest(9, 'Range: 26 Average: 11.17 Median: 9.50');
  DoTest(10, 'Range: 35 Average: 15.00 Median: 14.00');
  DoTest(11, 'Range: 53 Average: 19.69 Median: 16.00');
  DoTest(11, 'Range: 53 Average: 19.69 Median: 16.00');
  DoTest(16, 'Range: 323 Average: 84.44 Median: 56.00');
  DoTest(17, 'Range: 485 Average: 112.66 Median: 73.50');
  DoTest(17, 'Range: 485 Average: 112.66 Median: 73.50');
  DoTest(18, 'Range: 728 Average: 151.44 Median: 96.00');
  DoTest(20, 'Range: 1457 Average: 268.11 Median: 152.00');
  DoTest(23, 'Range: 4373 Average: 633.44 Median: 315.00');
  DoTest(26, 'Range: 13121 Average: 1500.90 Median: 625.00');
  DoTest(27, 'Range: 19682 Average: 2009.29 Median: 775.00');
  DoTest(28, 'Range: 26243 Average: 2669.98 Median: 980.00');
  DoTest(29, 'Range: 39365 Average: 3558.37 Median: 1224.50');
  DoTest(30, 'Range: 59048 Average: 4764.89 Median: 1538.00');
  DoTest(32, 'Range: 118097 Average: 8457.17 Median: 2420.00');
  DoTest(41, 'Range: 3188645 Average: 113720.82 Median: 17745.00');
  DoTest(44, 'Range: 9565937 Average: 271332.21 Median: 33796.00');
  DoTest(46, 'Range: 19131875 Average: 484712.39 Median: 51975.00');
  DoTest(50, 'Range: 86093441 Average: 1552316.81 Median: 120960.00');
end.
