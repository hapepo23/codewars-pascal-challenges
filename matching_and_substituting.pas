{
5 kyu
Matching And Substituting
https://www.codewars.com/kata/59de1e2fe50813a046000124
}

program matching_and_substituting;

{$mode objfpc}{$H+}

uses
  matching_and_substituting_unit,
  StrUtils;

var
  s: string;

  procedure DoTest(s, prog, version: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := Change(s, prog, version);
    writeln('Data .......: ', LineEnding, ReplaceStr(s, '\n', LineEnding));
    writeln('Program name: ', prog);
    writeln('Version     : ', version);
    writeln('Expected    : ', Expected);
    writeln('Actual      : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  s := 'Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-0091\nDate: Tues April 9, 2005\nVersion: 2.0\nLevel: Alpha';
  DoTest(s, 'Ladder', '1.1',
    'Program: Ladder Author: g964 Phone: +1-503-555-0090 Date: 2019-01-01 Version: 2.0');
  s := 'Program title: Balance\nAuthor: Dorries\nCorporation: Funny\nPhone: +1-503-555-0095\nDate: Tues July 19, 2014\nVersion: 6.7\nLevel: Release';
  DoTest(s, 'Circular', '1.5',
    'Program: Circular Author: g964 Phone: +1-503-555-0090 Date: 2019-01-01 Version: 1.5');
  s := 'Program title: Circular\nAuthor: Stan\nCorporation: Apple\nPhone: +1-503-555-0098\nDate: Tues March 10, 2004\nVersion: 1.5\nLevel: Release';
  DoTest(s, 'Bicycle', '2.0',
    'Program: Bicycle Author: g964 Phone: +1-503-555-0090 Date: 2019-01-01 Version: 2.0');
  s := 'Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-009\nDate: Tues April 9, 2005\nVersion: 6.7\nLevel: Alpha';
  DoTest(s, 'Ladder', '1.1', 'ERROR: VERSION or PHONE');
  s := 'Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-0009\nDate: Tues April 9, 2005\nVersion: 6.7.7\nLevel: Alpha';
  DoTest(s, 'Ladder', '1.1', 'ERROR: VERSION or PHONE');
end.
