{
6 kyu
Easy Balance Checking
https://www.codewars.com/kata/59d727d40e8c9dd2dd00009f
}

unit easy_balance_checking_unit;

{$mode objfpc}{$H+}

interface

function Balance(book: string): string;

implementation

uses
  SysUtils,
  StrUtils,
  RegExpr;

type
  TStrArray = array of string;

function Balance(book: string): string;
var
  Lines, cols: TStrArray;
  i: integer;
  bal, start, Value: double;
  Count: integer;
begin
  Result := '';
  Lines := SplitString(book, '\n');
  Count := 0;
  for i := 0 to High(Lines) do
  begin
    Lines[i] := Trim(Lines[i]);
    if Length(Lines[i]) > 0 then
      Lines[i] := ReplaceRegExpr('[^. a-zA-Z0-9]', Lines[i], '');
    if Length(Lines[i]) > 0 then
      Lines[i] := ReplaceRegExpr('[ ]{2,}', Lines[i], ' ');
    Lines[i] := Trim(Lines[i]);
    if Length(Lines[i]) > 0 then
    begin
      cols := SplitString(Lines[i], ' ');
      if i = 0 then
      begin
        bal := StrToFloat(cols[0]);
        start := bal;
        Result := Result + 'Original Balance: ' + Format('%f', [start]) + '\n';
      end
      else
      begin
        Inc(Count);
        Value := StrToFloat(cols[2]);
        bal := bal - Value;
        Result := Result + cols[0] + ' ' + cols[1] + ' ' + Format('%f', [Value]) +
          ' Balance ' + Format('%f', [bal]) + '\n';
      end;
    end;
  end;
  Result := Result + 'Total expense  ' + Format('%f', [start - bal]) + '\n';
  if Count = 0 then
    Result := Result + 'Average expense  ' + Format('%f', [0.00])
  else
    Result := Result + 'Average expense  ' + Format('%f', [(start - bal) / Count]);
end;

end.
