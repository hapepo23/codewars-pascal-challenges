{
6 kyu
Texting with an old-school mobile phone
https://www.codewars.com/kata/5ca24526b534ce0018a137b5
}

unit old_school_texting_unit;

{$mode objfpc}{$H+}

interface

function SendMessage(msg: string): string;

implementation

type
  Chars = ' ' .. 'z';

const
  Trans: array[Chars] of string = (
    '0',        {32=SPACE}
    '1111',     {33=!}
    '',         {34="}
    '#-',       {35=#}
    '',         {36=$}
    '',         {37=%}
    '',         {38=&}
    '*',        {39='}
    '',         {40=(}
    '',         {41=)}
    '*-',       {42=*}
    '***',      {43=+}
    '11',       {44=,}
    '**',       {45=-}
    '1',        {46=.}
    '',         {47=/}
    '0-',       {48=0}
    '1-',       {49=1}
    '2-',       {50=2}
    '3-',       {51=3}
    '4-',       {52=4}
    '5-',       {53=5}
    '6-',       {54=6}
    '7-',       {55=7}
    '8-',       {56=8}
    '9-',       {57=9}
    '',         {58=:}
    '',         {59=;}
    '',         {60=<}
    '****',     {61==}
    '',         {62=>}
    '111',      {63=?}
    '',         {64=@}
    '^2',       {65=A}
    '^22',      {66=B}
    '^222',     {67=C}
    '^3',       {68=D}
    '^33',      {69=E}
    '^333',     {70=F}
    '^4',       {71=G}
    '^44',      {72=H}
    '^444',     {73=I}
    '^5',       {74=J}
    '^55',      {75=K}
    '^555',     {76=L}
    '^6',       {77=M}
    '^66',      {78=N}
    '^666',     {79=O}
    '^7',       {80=P}
    '^77',      {81=Q}
    '^777',     {82=R}
    '^7777',    {83=S}
    '^8',       {84=T}
    '^88',      {85=U}
    '^888',     {86=V}
    '^9',       {87=W}
    '^99',      {88=X}
    '^999',     {89=Y}
    '^9999',    {90=Z}
    '',         {91=[}
    '',         {92=\}
    '',         {93=]}
    '',         {94=^}
    '',         {95=_}
    '',         {96=`}
    'v2',       {97=a}
    'v22',      {98=b}
    'v222',     {99=c}
    'v3',       {100=d}
    'v33',      {101=e}
    'v333',     {102=f}
    'v4',       {103=g}
    'v44',      {104=h}
    'v444',     {105=i}
    'v5',       {106=j}
    'v55',      {107=k}
    'v555',     {108=l}
    'v6',       {109=m}
    'v66',      {110=n}
    'v666',     {111=o}
    'v7',       {112=p}
    'v77',      {113=q}
    'v777',     {114=r}
    'v7777',    {115=s}
    'v8',       {116=t}
    'v88',      {117=u}
    'v888',     {118=v}
    'v9',       {119=w}
    'v99',      {120=x}
    'v999',     {121=y}
    'v9999'     {122=z}
    );


function SendMessage(msg: string): string;
var
  lower: boolean = True;
  curr: Chars;
  i: integer;
  lastchar: char = ' ';
  tr: string;
  firstchar: char;
begin
  Result := '';
  for i := 1 to Length(msg) do
  begin
    if not (msg[i] in [Low(Trans)..High(Trans)]) then
      Continue;
    curr := msg[i];
    tr := Trans[curr];
    if tr = '' then
      Continue;
    firstchar := tr[1];
    if (firstchar = '^') or (firstchar = 'v') then
    begin
      tr := Copy(tr, 2);
      if (lower and (firstchar = '^')) or ((not lower) and (firstchar = 'v')) then
      begin
        lower := not lower;
        Result := Result + '#';
        lastchar := '#';
      end;
    end;
    if tr[1] = lastchar then
      Result := Result + ' ';
    Result := Result + tr;
    lastchar := tr[Length(tr)];
    if lastchar = '-' then
      lastchar := ' ';
  end;
end;

end.
