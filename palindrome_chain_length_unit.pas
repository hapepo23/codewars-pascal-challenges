{
7 kyu
Palindrome chain length
https://www.codewars.com/kata/525f039017c7cd0e1a000a26
}

unit palindrome_chain_length_unit;

{$mode Objfpc}{$H+}

interface

function PalindromeChainLength(n: integer): integer;

implementation

function PalindromeChainLength(n: integer): integer;
var
  orig, rev, r: integer;
begin
  Result := 0;
  if n > 9 then
  begin
    while True do
    begin
      rev := 0;
      orig := n;
      while n > 0 do
      begin
        r := n mod 10;
        n := n div 10;
        rev := rev * 10 + r;
      end;
      if rev = orig then
        Break
      else
        n := orig + rev;
      Result := Result + 1;
    end;
  end;
end;

end.
