{
7 kyu
Vowel Count
https://www.codewars.com/kata/54ff3102c1bad923760001f3
}

program vowel_count;

{$mode objfpc}{$H+}

uses
  vowel_count_unit;

  procedure DoTest(s: string; Expected: integer);
  var
    Actual: integer;
  begin
    Actual := GetCount(s);
    writeln('String s: ', s);
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest('abracadabra', 5);
  DoTest('pear tree', 4);
  DoTest('o a kak ushakov lil vo kashu kakao', 13);
  DoTest('', 0);
  DoTest('tk r n m kspkvgiw qkeby lkrpbk uo thouonm fiqqb kxe ydvr n uy e' +
    ' oapiurrpli c ovfaooyfxxymfcrzhzohpek w zaa tue uybclybrrmokmjjnwesh' +
    'mqpmqptmszsvyayry kxa hmoxbxio qrucjrioli  ctmoozlzzihme tikvkb mkuf' +
    'evrx a vutvntvrcjwqdabyljsizvh affzngslh  ihcvrrsho pbfyojewwsxcexwk' +
    'qjzfvu yzmxroamrbwwcgo dte zulk ajyvmzulm d avgc cl frlyweezpn pezmr' +
    'zpdlp yqklzd l ydofbykbvyomfoyiat mlarbkdbte fde pg   k nusqbvquc do' +
    'vtgepkxotijljusimyspxjwtyaijnhllcwpzhnadrktm fy itsms ssrbhy zhqphyf' +
    'hjuxfflzpqs mm fyyew ubmlzcze hnq zoxxrprmcdz jes  gjtzo bazvh  tmp ' +
    'lkdas z ieykrma lo  u placg x egqj kugw lircpswb dwqrhrotfaok sz cuy' +
    'ycqdaazsw  bckzazqo uomh lbw hiwy x  qinfgwvfwtuzneakrjecruw ytg sma' +
    'kqntulqhjmkhpjs xwqqznwyjdsbvsrmh pzfihwnwydgxqfvhotuzolc y mso holm' +
    'kj  nk mbehp dr fdjyep rhvxvwjjhzpv  pyhtneuzw dbrkg dev usimbmlwhee' +
    'ef aaruznfdvu cke ggkeku unfl jpeupytrejuhgycpqhii  cdqp foxeknd djh' +
    'unxyi ggaiti prkah hsbgwra ffqshfq hoatuiq fgxt goty', 168);
end.
