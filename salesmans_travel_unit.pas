{
6 kyu
Salesman's Travel
https://www.codewars.com/kata/56af1a20509ce5b9b000001e
}

unit salesmans_travel_unit;

{$mode objfpc}{$H+}

interface

function Travel(s, zipcode: string): string;

implementation

uses
  StrUtils,
  SysUtils;

function Travel(s, zipcode: string): string;
var
  house_number, street_and_town, zip, result_hn: string;
  address_raw_data: array of string;
  i, pos_first_blank: integer;
  notfirst: boolean;
begin
  if (s = '') or (zipcode = '') then
    Exit(':/');
  Result := zipcode + ':';
  result_hn := '';
  notfirst := False;
  address_raw_data := SplitString(s, ',');
  for i := 0 to High(address_raw_data) do
  begin
    address_raw_data[i] := Trim(address_raw_data[i]);
    pos_first_blank := Pos(' ', address_raw_data[i]);
    house_number :=
      Copy(address_raw_data[i], 1, pos_first_blank - 1);
    street_and_town :=
      Trim(Copy(address_raw_data[i], pos_first_blank, Length(address_raw_data[i]) -
      pos_first_blank - 8));
    zip := RightStr(address_raw_data[i], 8);
    if zip = zipcode then
    begin
      if notfirst then
      begin
        Result := Result + ',';
        result_hn := result_hn + ',';
      end
      else
        notfirst := True;
      Result := Result + street_and_town;
      result_hn := result_hn + house_number;
    end;
  end;
  Result := Result + '/' + result_hn;
end;

end.
