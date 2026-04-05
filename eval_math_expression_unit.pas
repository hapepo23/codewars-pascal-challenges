{
2 kyu
Evaluate mathematical expression
https://www.codewars.com/kata/52a78825cdfc2cfc87000005
}

unit eval_math_expression_unit;

{$mode objfpc}{$H+}

interface

function Calc(expression: string): double;

implementation

uses
  Math,
  SysUtils;

var
  str: string;
  pos: integer;
  len: integer;

procedure SkipSpaces(); forward;
function ParseFactor(): double; forward;
function ParseTerm(): double; forward;
function ParseExpression(): double; forward;

procedure SkipSpaces();
begin
  while (pos <= len) and (str[pos] <= ' ') do
    Inc(pos);
end;

function ParseFactor(): double;
var
  start: integer;
begin
  SkipSpaces();
  if (pos <= len) and (str[pos] = '-') then
  begin
    Inc(pos);
    Exit(-ParseFactor());
  end;
  if (pos <= len) and (str[pos] = '(') then
  begin
    Inc(pos);
    Result := ParseExpression();
    SkipSpaces();
    Inc(pos);  // remove ')'
    Exit(Result);
  end;
  start := pos;
  while (pos <= len) and (((str[pos] >= '0') and (str[pos] <= '9')) or
      (str[pos] = '.')) do
    Inc(pos);
  Result := StrToFloat(Copy(str, start, pos - start));
end;

function ParseTerm(): double;
var
  op: char;
  rhs: double;
begin
  Result := ParseFactor();
  while True do
  begin
    SkipSpaces();
    if (pos <= len) and ((str[pos] = '*') or (str[pos] = '/')) then
    begin
      op := str[pos];
      Inc(pos);
      rhs := ParseFactor();
      case op of
        '*': Result *= rhs;
        '/': Result /= rhs;
      end;
    end
    else
      Break;
  end;
end;

function ParseExpression(): double;
var
  op: char;
  rhs: double;
begin
  Result := ParseTerm();
  while True do
  begin
    SkipSpaces();
    if (pos <= len) and ((str[pos] = '+') or (str[pos] = '-')) then
    begin
      op := str[pos];
      Inc(pos);
      rhs := ParseTerm();
      case op of
        '+': Result += rhs;
        '-': Result -= rhs;
      end;
    end
    else
      Break;
  end;
end;

function Calc(expression: string): double;
begin
  pos := 1;
  str := expression;
  len := Length(str);
  try
    Result := ParseExpression();
  except
    Result := NaN;
  end;
end;

end.
