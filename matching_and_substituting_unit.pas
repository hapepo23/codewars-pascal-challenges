{
5 kyu
Matching And Substituting
https://www.codewars.com/kata/59de1e2fe50813a046000124
}

unit matching_and_substituting_unit;

{$mode objfpc}{$H+}

interface

function Change(s, prog, version: string): string;

implementation

uses
  RegExpr,
  SysUtils;

function Change(s, prog, version: string): string;
const
  revers_str = '\\nVersion:\s+([0-9]+\.[0-9]+)\\n';
  rephone_str = '\\nPhone:\s+(\+1\-[0-9]{3}\-[0-9]{3}\-[0-9]{4})\\n';
var
  revers, rephone: TRegExpr;
  err1: boolean = False;
  err2: boolean = False;
begin
  s := '\n' + Trim(s) + '\n';
  revers := TRegExpr.Create(revers_str);
  rephone := TRegExpr.Create(rephone_str);
  err1 := not (revers.Exec(s) and (revers.SubExprMatchCount = 1));
  if revers.Match[1] = '2.0' then
    version := '2.0';
  err2 := not (rephone.Exec(s) and (rephone.SubExprMatchCount = 1));
  if err1 or err2 then
    Result := 'ERROR: VERSION or PHONE'
  else
    Result := 'Program: ' + prog +
      ' Author: g964 Phone: +1-503-555-0090 Date: 2019-01-01 Version: ' + version;
  revers.Free;
  rephone.Free;
end;

end.
