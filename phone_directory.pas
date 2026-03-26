{
5 kyu
Phone Directory
https://www.codewars.com/kata/56baeae7022c16dd7400086e
}

program phone_directory;

{$mode objfpc}{$H+}

uses
  phone_directory_unit,
  StrUtils;

const
  directory: string = '/+1-541-754-3010 156 Alphand_St. <J Steeve>\n' +
    ' 133, Green, Rd. <E Kustur> NY-56423 ;+1-541-914-3010\n' +
    '<Anastasia> +48-421-674-8974 Via Quirinal  Roma\n' +
    ' <P Salinger> Main Street, +1-098-512-2222, Denver\n' +
    '<C Powel> *+19-421-674-8974 Chateau des Fosses Strasbourg F-68000\n' +
    ' <Bernard Deltheil> +1-498-512-2222; Mount Av.  Eldorado\n' +
    '<P Salinge> Main Street, +1-098-512-2222, Denve\n' +
    '<Elizabeth Corber> +8-421-674-8974 Via Papa Roma\n' +
    ' <C Saborn> Main Street, +15-098-512-2222, Boulder\n' +
    '<Colin Marshall> *+9-421-674-8974 Edinburgh UK\n' +
    ' <Bernard Povit> +3-498-512-2222; Hill Av.  Cameron\n';

  procedure DoTest(dir, num: string; Expected: string);
  var
    Actual: string;
  begin
    Actual := Phone(dir, num);
    writeln('Phone Book:' + LineEnding + '----------' + LineEnding +
      ReplaceStr(dir, '\n', LineEnding) + LineEnding + '----------');
    writeln('Expected  : ', Expected);
    writeln('Actual    : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(directory, '8-421-674-8974',
    'Phone => 8-421-674-8974, Name => Elizabeth Corber, Address => Via Papa Roma');
  DoTest(directory, '48-421-674-8974',
    'Phone => 48-421-674-8974, Name => Anastasia, Address => Via Quirinal Roma');
  DoTest(directory, '1-098-512-2222', 'Error => Too many people: 1-098-512-2222');
  DoTest(directory, '5-555-555-5555', 'Error => Not found: 5-555-555-5555');
end.
