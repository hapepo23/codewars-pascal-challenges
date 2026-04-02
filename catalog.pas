{
6 kyu
Catalog
https://www.codewars.com/kata/59d9d8cb27ee005972000045
}

program catalog_main;

{$mode objfpc}{$H+}

uses
  catalog_unit;

const
  lele = LineEnding + LineEnding;
  s = '<prod><name>hammer</name><prx>10</prx><qty>50</qty></prod>' +
    lele + '<prod><name>wheel</name><prx>8.80</prx><qty>32</qty></prod>' +
    lele + '<prod><name>extractor</name><prx>105</prx><qty>17</qty></prod>' +
    lele + '<prod><name>ladder</name><prx>112</prx><qty>12</qty></prod>' +
    lele + '<prod><name>car wheel</name><prx>505</prx><qty>7</qty></prod>' +
    lele + '<prod><name>bicycle wheel</name><prx>150</prx><qty>11</qty></prod>' +
    lele + '<prod><name>big hammer</name><prx>18</prx><qty>12</qty></prod>' +
    lele + '<prod><name>wood pallet</name><prx>65</prx><qty>21</qty></prod>' +
    lele + '<prod><name>window fan</name><prx>62</prx><qty>8</qty></prod>';

  procedure DoTest(s, article, Expected: string);
  var
    Actual: string;
  begin
    Actual := Catalog(s, article);
    writeln('Catalog.......: ', LineEnding, s);
    writeln('Article : ', article);
    writeln('Expected......: ', LineEnding, Expected);
    writeln('Actual........: ', LineEnding, Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(s, 'ladder', 'ladder > prx: $112 qty: 12');
  DoTest(s, 'wood pallet', 'wood pallet > prx: $65 qty: 21');
  DoTest(s, 'nails', 'Nothing');
  DoTest(s, 'extractor', 'extractor > prx: $105 qty: 17');
  DoTest(s, 'wheel', 'wheel > prx: $8.80 qty: 32' + LineEnding +
    'car wheel > prx: $505 qty: 7' + LineEnding +
    'bicycle wheel > prx: $150 qty: 11');
end.
