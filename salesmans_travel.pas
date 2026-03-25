{
6 kyu
Salesman's Travel
https://www.codewars.com/kata/56af1a20509ce5b9b000001e
}

program salesmans_travel;

{$mode objfpc}{$H+}

uses
  salesmans_travel_unit;

const
  ad: string =
    '10 Pussy Cat Rd. Chicago EX 34342,' + '10 Gordon St. Atlanta RE 13000,' +
    '58 Gordon Road Atlanta RE 13000,' + '22 Tokyo Av. Tedmondville SW 43098,' +
    '674 Paris bd. Abbeville AA 45521,' + '10 Surta Alley Goodtown GG 30654,' +
    '100 Pussy Cat Rd. Chicago EX 34342,' + '2 Gordon St. Atlanta RE 13000,' +
    '5 Gordon Road Atlanta RE 13000,' + '2200 Tokyo Av. Tedmondville SW 43098,' +
    '67 Paris St. Abbeville AA 45521,' + '11 Surta Avenue Goodtown GG 30654,' +
    '100 Pussy Cat Rd. Chicago EX 34345,' + '2 Gordon St. Atlanta RE 13222,' +
    '5 Gordon Road Atlanta RE 13001,' + '2200 Tokyo Av. Tedmondville SW 43198,' +
    '67 Paris St. Abbeville AA 45522,' + '11 Surta Avenue Goodville GG 30655,' +
    '2222 Tokyo Av. Tedmondville SW 43198,' + '670 Paris St. Abbeville AA 45522,' +
    '114 Surta Avenue Goodville GG 30655,' +
    '2 Holy Grail Street Niagara Town ZP 32908,' + '3 Main Rd. Bern AE 56210,' +
    '77 Gordon St. Atlanta RE 13000';

  procedure DoTest(s, zipcode: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := Travel(s, zipcode);
    writeln('Address data   : ', s);
    writeln('Zipcode        : ', zipcode);
    writeln('Expected       : ', Expected);
    writeln('Actual         : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(ad, '', ':/');
  DoTest(ad, 'BB 66677', 'BB 66677:/');
  DoTest(ad, 'AA 45522', 'AA 45522:Paris St. Abbeville,Paris St. Abbeville/67,670');
  DoTest(ad, 'EX 34342', 'EX 34342:Pussy Cat Rd. Chicago,Pussy Cat Rd. Chicago/10,100');
end.
