{
6 kyu
Catalog
https://www.codewars.com/kata/59d9d8cb27ee005972000045
}

unit catalog_unit;

{$mode objfpc}{$H+}

interface

function Catalog(s, article: string): string;

implementation

uses
  SysUtils,
  RegExpr;

function Catalog(s, article: string): string;
var
  parts: TStringArray;
  i: integer;
  re: TRegExpr;
  res, lele: string;
begin
  lele := LineEnding + LineEnding;
  parts := s.Split(lele);
  res := '^<prod><name>(.*' + article +
    '[^<]*)</name><prx>([0-9.]+)</prx><qty>([0-9]+)</qty></prod>$';
  re := TRegExpr.Create(res);
  Result := '';
  for i := Low(parts) to High(parts) do
  begin
    parts[i] := Trim(parts[i]);
    if re.Exec(parts[i]) and (re.SubExprMatchCount = 3) then
    begin
      if Result <> '' then
        Result += LineEnding;
      Result += re.Match[1] + ' > prx: $' + re.Match[2] + ' qty: ' + re.Match[3];
    end;
  end;
  re.Free;
  if Result = '' then
    Result := 'Nothing';
end;

end.
