{
6 kyu
Meeting
https://www.codewars.com/kata/59df2f8f08c6cec835000012
}

unit meeting_unit;

{$mode objfpc}{$H+}

interface

function Meeting(s: string): string;

implementation

uses
  Generics.Collections,
  SysUtils;

function Meeting(s: string): string;
var
  parts, names, p: TStringArray;
  i: integer;
begin
  parts := s.Split(';');
  names := [];
  SetLength(names, Length(parts));
  for i := Low(parts) to High(parts) do
  begin
    p := parts[i].Split(':');
    names[i] := '(' + UpperCase(p[1]) + ', ' + UpperCase(p[0]) + ')';
  end;
  specialize TArrayHelper<string>.Sort(names);
  Result := string.Join('', names);
end;

end.
