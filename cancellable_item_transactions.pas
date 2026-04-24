{
6 kyu
Cancellable Item Transactions
https://www.codewars.com/kata/69bf57993a0061ef6d03c095
}

program cancellable_item_transactions;

{$mode objfpc}{$H+}

uses
  SysUtils,
  StrUtils,
  cancellable_item_transactions_unit;

  function CreatePriceDict(price_dict_str: string): TPriceDict;
  var
    price_data, price_item: array of string;
    s: string;
    c: TAlphabet;
  begin
    Result := TPriceDict.Create;
    price_data := SplitString(price_dict_str, ',');
    for s in price_data do
    begin
      price_item := SplitString(s, ':');
      price_item[0] := Trim(price_item[0]);
      c := price_item[0][1];
      Result.Add(c, StrToInt64(price_item[1]));
    end;
  end;

  procedure GenerateRandom(out price_dict_str: string; out transaction: string;
    out Expected: int64);
  var
    litems, i, j, p, v: integer;
    items: array of string = ();
    sel: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    price_dict: TPriceDict;
  begin
    litems := Random(16) + 4;
    SetLength(items, litems);
    for i:= 0 to litems-1 do
    begin
      p := Random(Length(sel))+1;
      items[i] := Copy(sel, p, 1);
      Delete(sel, p, 1);
    end;
    price_dict_str := items[0] + ':' + InttoStr(1+Random(100));
    for i:= 1 to litems-1 do
      price_dict_str += ',' + items[i] + ':' + InttoStr(1+Random(100));
    transaction := '';
    for i:= 1 to Random(200)+30 do
    begin
      p := Random(litems);
      j := Random(100);
      v := 5+Random(25);
      if j < 20 then
        transaction += items[p]
      else
        transaction += InttoStr(v) + items[p];
    end;
    price_dict := CreatePriceDict(price_dict_str);
    Expected := Calculate(price_dict, transaction);
    price_dict.Free;
  end;

  procedure DoTest(price_dict_str, transaction: string; Expected: int64);
  var
    Actual: int64;
    price_dict: TPriceDict;
  begin
    price_dict := CreatePriceDict(price_dict_str);
    Actual := Calculate(price_dict, transaction);
    writeln('Prices      : ', price_dict_str);
    writeln('Transactions: ', transaction);
    writeln('Expected    : ', Expected);
    writeln('Actual      : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
    price_dict.Free;
  end;

var
  price_dict_str: string;
  transaction: string;
  Expected, i: int64;
begin
  DoTest('X:0,Y:0,Z:0', '5X6Y20Z1X6Y', 0);
  DoTest('R:1,Q:2,E:3,X:4', '4R1Q4X2E1R2X', 37);
  DoTest('T:12,F:6', '2F5T1T', 84);
  DoTest('G:1,M:1,F:1,H:1,J:1', '5J2F7M1H9G6M1H', 31);
  DoTest('E:67', '1E', 67);
  DoTest('X:3,Y:3,Z:3', '2X-1Y7X2Z-1Z9Y5X-3Y', 60);
  DoTest('W:12', '9W6W-2W8W5W-4W1W', 276);
  DoTest('X:1,Y:2,Z:5', '10X22Y12Z2X', 116);
  DoTest('K:0,P:2,B:6,M:4', '50K10P42B521M4K125B', 3106);
  DoTest('A:3,B:1,C:4', '3C2B1AC', 5);
  DoTest('D:6,B:10,G:2', '5D4GG6B2D1GBD', 32);
  DoTest('A:4,B:3,C:2,D:1', '6D1A3B5A2C3AAAA', 19);
  DoTest('S:12,I:56,G:2,M:1,A:8', '5G1S7M2I9A6SMISGAS', 0);
  DoTest('T:1,V:5', '6TVTT2V', 10);
  DoTest('L:2,M:4,N:6,O:8', '12LO3MLL5L1O4N', 54);
  DoTest('W:2,D:4', 'DWDWDWWD', 0);
  DoTest('J:226,Q:217,X:196,Y:458', '-327X75Y-25Q-333JQJ-319J344X495JYY-278J', -19720);
  DoTest('U:438,S:455,H:495',
    '-54US58SU426H-438S-379H-121UH206SH453UH-470U-28SU-241U461SH386H437HH-42HUU-150H-63U437HS287H169H-256H395U361U10H-52HS-485H-341SH-168HHU',
    248648);
  DoTest('D:251,A:229,F:223,G:70,I:161,Z:147,N:461,B:177,R:326,L:89',
    'AL-149B-334BD-348N-287R-127NZD1L-144N-150A11B-471A226NBRLG373N-357ZN-368L448I52G429L-256N-98L61NAD-90Z-228IRGZI',
    -374553);
  Randomize;
  for i:=1 to 100 do
  begin
    GenerateRandom(price_dict_str, transaction, Expected);
    DoTest(price_dict_str, transaction, Expected);
  end;
end.
