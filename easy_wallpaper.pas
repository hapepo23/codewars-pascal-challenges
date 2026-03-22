{
7 kyu
Easy wallpaper
https://www.codewars.com/kata/567501aec64b81e252000003
}

program easy_wallpaper;

{$mode objfpc}{$H+}

uses
  easy_wallpaper_unit;

  procedure DoTest(l, w, h: double; Expected: string);
  var
    Actual: string;
  begin
    Actual := WallPaper(l, w, h);
    writeln('Length  : ', l: 5: 2);
    writeln('Width   : ', w: 5: 2);
    writeln('Height  : ', h: 5: 2);
    writeln('Expected:  ', Expected);
    writeln('Actual  :  ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(6.3, 4.5, 3.29, 'sixteen');
  DoTest(6.3, 4.5, 0.0, 'zero');
  DoTest(4.0, 3.5, 3.0, 'ten');
  DoTest(6.3, 5.8, 3.13, 'seventeen');
end.
