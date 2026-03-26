{
6 kyu
Help the bookseller !
https://www.codewars.com/kata/54dc6f5a224c26032800005c
}

program help_the_bookseller;

{$mode objfpc}{$H+}

uses
  help_the_bookseller_unit,
  StrUtils,
  SysUtils;

var
  b, c: TStringArray;

  function ArrayOfStringToString(A: TStringArray): string;
  var
    i: int64;
    res: string;
  begin
    res := '[';
    for i := 0 to High(A) do
    begin
      res += A[i] + ', ';
    end;
    if (res = '[') then
      Result := '[]'
    else
      Result := Copy(res, 1, Length(res) - 2) + ']';
  end;

  procedure DoTest(lstOfArt, lstOf1stLetter: TStringArray; Expected: string);
  var
    Actual: string;
  begin
    Actual := StockSummary(lstOfArt, lstOf1stLetter);
    writeln('Stocklist : ', ArrayOfStringToString(lstOfArt));
    writeln('Catagories: ', ArrayOfStringToString(lstOf1stLetter));
    writeln('Expected  : ', Expected);
    writeln('Actual    : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  b := ['BBAR 150', 'CDXE 515', 'BKWR 250', 'BTSQ 890', 'DRTY 600'];
  c := ['A', 'B', 'C', 'D'];
  DoTest(b, c, '(A : 0) - (B : 1290) - (C : 515) - (D : 600)');
  b := ['ABAR 200', 'CDXE 500', 'BKWR 250', 'BTSQ 890', 'DRTY 600'];
  c := ['A', 'B'];
  DoTest(b, c, '(A : 200) - (B : 1140)');
  b := ['CBART 20', 'CDXEF 50', 'BKWRK 25', 'BTSQZ 89', 'DRTYM 60'];
  c := ['A', 'B', 'C', 'W'];
  DoTest(b, c, '(A : 0) - (B : 114) - (C : 70) - (W : 0)');
end.
