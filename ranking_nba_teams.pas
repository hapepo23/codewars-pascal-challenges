{
6 kyu
Ranking NBA teams
https://www.codewars.com/kata/5a420163b6cfd7cde5000077
}

program ranking_nba_teams;

{$mode objfpc}{$H+}

uses
  ranking_nba_teams_unit,
  StrUtils,
  SysUtils;

const
  t1: string =
    'New York Knicks 101 Atlanta Hawks 112,Indiana Pacers 103 Memphis Grizzlies 112,' +
    'Los Angeles Lakers 111 Minnesota Timberwolves 112,Boston Celtics 112 Philadelphia 76ers 95,'
    + 'Los Angeles Lakers 104 Portland Trail Blazers 102,Memphis Grizzlies 76 Cleveland Cavaliers 106,'
    + 'Miami Heat 110 Washington Wizards 105,Atlanta Hawks 94 Detroit Pistons 106,' +
    'Toronto Raptors 106 Indiana Pacers 99,Golden State Warriors 111 New Orleans Pelicans 95,'
    + 'San Antonio Spurs 111 Houston Rockets 86,Chicago Bulls 103 Indiana Pacers 94,' +
    'Boston Celtics 81 Philadelphia 76ers 65,Detroit Pistons 115 Atlanta Hawks 87,' +
    'Los Angeles Lakers 97 Golden State Warriors 136,Boston Celtics 99 New York Knicks 85,'
    + 'Indiana Pacers 98 Charlotte Hornets 86,Atlanta Hawks 81 Memphis Grizzlies 82,' +
    'Boston Celtics 111 Brooklyn Nets 105,Charlotte Hornets 94 Chicago Bulls 86';
  t2: string =
    'Los Angeles Clippers 104 Dallas Mavericks 88,New York Knicks 101.12 Atlanta Hawks 112,'
    + 'Indiana Pacers 103 Memphis Grizzlies 112,Los Angeles Clippers 100 Boston Celtics 120';

  procedure DoTest(resultSheet, toFind, expected: string);
  var
    actual: string;
  begin
    actual := NbaCup(resultSheet, toFind);
    writeln('Result sheet: ', LineEnding, ReplaceStr(resultSheet, ',',
      ',' + LineEnding));
    writeln('To find : ', toFind);
    writeln('Expected: ', expected);
    writeln('Actual  : ', actual);
    if expected = actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(t1, 'Boston Celt', 'Boston Celt:This team didn''t play!');
  DoTest(t1, 'Los Angeles Lakers',
    'Los Angeles Lakers:W=1;D=0;L=2;Scored=312;Conceded=350;Points=3');
  DoTest(t1, 'Indiana Pacers',
    'Indiana Pacers:W=1;D=0;L=3;Scored=394;Conceded=407;Points=3');
  DoTest(t1, 'Philadelphia 76ers',
    'Philadelphia 76ers:W=0;D=0;L=2;Scored=160;Conceded=193;Points=0');
  DoTest(t1, '', '');
  DoTest(t2, 'Atlanta Hawks',
    'Error(float number):New York Knicks 101.12 Atlanta Hawks 112');
end.
