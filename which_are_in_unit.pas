{
6 kyu
Which are in?
https://www.codewars.com/kata/550554fd08b86f84fe000a58
}

unit which_are_in_unit;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

function inArray(a1, a2: TStringArray): TStringArray;

implementation

uses
  Generics.Collections;

type
  TStrList = specialize TList<string>;

function inArray(a1, a2: TStringArray): TStringArray;
var
  list: TStrList;
  item1, item2: string;
  i: integer;
begin
  Result := [];
  list := TStrList.Create;
  for item1 in a1 do
    for item2 in a2 do
      if Pos(item1, item2) > 0 then
        if not list.Contains(item1) then
        begin
          list.Add(item1);
          Break;
        end;
  list.Sort();
  SetLength(Result, list.Count);
  for i := 0 to list.Count - 1 do
    Result[i] := list[i];
  FreeAndNil(list);
end;

end.
