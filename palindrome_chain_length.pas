{
7 kyu
Palindrome chain length
https://www.codewars.com/kata/525f039017c7cd0e1a000a26
}

program palindrome_chain_length;

{$mode objfpc}{$H+}

uses
  palindrome_chain_length_unit;

  procedure DoTest(n: integer; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := PalindromeChainLength(n);
    writeln('Number  : ', n);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(1, 0);
  DoTest(88, 0);
  DoTest(87, 4);
  DoTest(10, 1);
end.
