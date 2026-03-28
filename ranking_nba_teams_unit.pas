{
6 kyu
Ranking NBA teams
https://www.codewars.com/kata/5a420163b6cfd7cde5000077
}

unit ranking_nba_teams_unit;

{$mode objfpc}{$H+}

interface

function NbaCup(resultSheet, toFind: string): string;

implementation

uses
  Generics.Collections,
  RegExpr,
  StrUtils,
  SysUtils,
  Types;

type
  TTeam = record
    teamname: string;
    num_wins: integer;
    num_draws: integer;
    num_losses: integer;
    pnts_scored: integer;
    pnts_conceded: integer;
    marks: integer;
  end;
  TTeamsDictionary = specialize TDictionary<string, TTeam>;
  TNamePair = array[1..2] of string;
  TScorePair = array[1..2] of integer;
  TDataPair = array[1..2] of TTeam;

function NewTeamData(n: string): TTeam;
begin
  Result.teamname := n;
  Result.num_wins := 0;
  Result.num_draws := 0;
  Result.num_losses := 0;
  Result.pnts_scored := 0;
  Result.pnts_conceded := 0;
  Result.marks := 0;
end;

procedure PutScorePairToTeamData(scorepair: TScorePair; var datapair: TDataPair);
var
  i, w, l: integer;
begin
  if scorepair[1] <> scorepair[2] then
  begin
    if scorepair[1] > scorepair[2] then
    begin
      w := 1;
      l := 2;
    end
    else
    begin
      w := 2;
      l := 1;
    end;
    datapair[w].num_wins := datapair[w].num_wins + 1;
    datapair[l].num_losses := datapair[l].num_losses + 1;
    datapair[w].marks := datapair[w].marks + 3;
  end
  else
    for i := 1 to 2 do
    begin
      datapair[i].num_draws := datapair[i].num_draws + 1;
      datapair[i].marks := datapair[i].marks + 1;
    end;
  for i := 1 to 2 do
  begin
    datapair[i].pnts_scored := datapair[i].pnts_scored + scorepair[i];
    datapair[i].pnts_conceded := datapair[i].pnts_conceded + scorepair[3 - i];
  end;
end;

function NbaCup(resultSheet, toFind: string): string;
const
  re_s: string = '^([A-Z][a-z A-Z0-9]+[a-z])\s+([0-9.]+)\s+' +
    '([A-Z][a-z A-Z0-9]+[a-z])\s+([0-9.]+)$';
var
  results: TStringDynArray;
  rec: string;
  re: TRegExpr;
  teamdata: TTeamsDictionary;
  i: integer;
  team: TTeam;
  namepair: TNamePair;
  scorepair: TScorePair;
  datapair: TDataPair;
begin
  if (resultSheet = '') or (toFind = '') then
    Exit('');
  re := TRegExpr.Create(re_s);
  teamdata := TTeamsDictionary.Create;
  results := SplitString(resultSheet, ',');
  for rec in results do
  begin
    if re.Exec(Trim(rec)) and (re.SubExprMatchCount = 4) then
    begin
      if (Pos('.', re.Match[2]) > 0) or (Pos('.', re.Match[2]) > 0) then
      begin
        FreeAndNil(teamdata);
        FreeAndNil(re);
        Exit('Error(float number):' + rec);
      end
      else
      begin
        for i := 1 to 2 do
        begin
          namepair[i] := re.Match[i * 2 - 1];
          scorepair[i] := StrToInt(re.Match[i * 2]);
          if not teamdata.ContainsKey(namepair[i]) then
            teamdata.Add(namepair[i], NewTeamData(namepair[i]));
          datapair[i] := teamdata[namepair[i]];
        end;
        PutScorePairToTeamData(scorepair, datapair);
        for i := 1 to 2 do
          teamdata.AddOrSetValue(namepair[i], datapair[i]);
      end;
    end;
  end;
  if not teamdata.ContainsKey(toFind) then
    Result := toFind + ':This team didn''t play!'
  else
  begin
    team := teamdata[toFind];
    Result := toFind + ':W=' + IntToStr(team.num_wins) + ';D=' +
      IntToStr(team.num_draws) + ';L=' + IntToStr(team.num_losses) +
      ';Scored=' + IntToStr(team.pnts_scored) + ';Conceded=' +
      IntToStr(team.pnts_conceded) + ';Points=' + IntToStr(team.marks);
  end;
  FreeAndNil(teamdata);
  FreeAndNil(re);
end;

end.
