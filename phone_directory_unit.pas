{
5 kyu
Phone Directory
https://www.codewars.com/kata/56baeae7022c16dd7400086e
}

unit phone_directory_unit;

{$mode objfpc}{$H+}

interface

function Phone(str, num: string): string;

implementation

uses
  SysUtils,
  StrUtils,
  RegExpr;

type
  TPhoneRecord = record
    phone: string;
    Name: string;
    address: string;
  end;
  TPhoneRecordArray = array of TPhoneRecord;
  TStrArray = array of string;

function Phone(str, num: string): string;
const
  res_name: string = '^.*\<([^>]*)\>.*$';
  res_tel: string = '^.*\+([0-9]{1,2}\-[0-9]{3}\-[0-9]{3}\-[0-9]{4}).*$';
var
  Lines: TStrArray;
  pb: TPhoneRecordArray;
  lpb, i, j, cnt: integer;
  re_name, re_tel: TRegExpr;
  pbentry: TPhoneRecord;
begin
  pb := nil;
  re_name := TRegExpr.Create(res_name);
  re_tel := TRegExpr.Create(res_tel);
  lpb := 0;
  Lines := SplitString(str, '\n');
  for i := 0 to High(Lines) do
  begin
    Lines[i] := Trim(Lines[i]);
    if Length(Lines[i]) > 0 then
    begin
      pbentry.Name := '';
      pbentry.address := '';
      pbentry.phone := '';
      if re_name.Exec(Lines[i]) and (re_name.SubExprMatchCount = 1) then
      begin
        pbentry.Name := re_name.Match[1];
        Delete(Lines[i], re_name.MatchPos[1], re_name.MatchLen[1]);
      end;
      if re_tel.Exec(Lines[i]) and (re_tel.SubExprMatchCount = 1) then
      begin
        pbentry.phone := re_tel.Match[1];
        Delete(Lines[i], re_tel.MatchPos[1], re_tel.MatchLen[1]);
      end;
      Lines[i] := ReplaceRegExpr('[^- _.a-zA-Z0-9]', Lines[i], '');
      Lines[i] := ReplaceRegExpr('[ ]{2,}', Lines[i], ' ');
      Lines[i] := ReplaceStr(Lines[i], '_', ' ');
      pbentry.address := Trim(Lines[i]);
      Inc(lpb);
      SetLength(pb, lpb);
      pb[lpb - 1] := pbentry;
    end;
  end;
  Lines := nil;
  cnt := 0;
  for i := 0 to High(pb) do
  begin
    if (pb[i].phone = num) then
    begin
      cnt := cnt + 1;
      if cnt = 1 then
        j := i
      else
        Break;
    end;
  end;
  if cnt = 0 then
    Result := 'Error => Not found: ' + num
  else if cnt = 1 then
    Result := 'Phone => ' + num + ', Name => ' + pb[j].Name +
      ', Address => ' + pb[j].address
  else
    Result := 'Error => Too many people: ' + num;
  re_name.Free;
  re_tel.Free;
  pb := nil;
end;

end.
