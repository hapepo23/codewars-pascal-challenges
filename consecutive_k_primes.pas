{
5 kyu
Consecutive k-Primes
https://www.codewars.com/kata/573182c405d14db0da00064e
}

program consecutive_k_primes;

{$mode objfpc}{$H+}

uses
  consecutive_k_primes_unit,
  SysUtils;

type
  TInt64Array = array of int64;

  function ArrayToString(A: TInt64Array): string;
  var
    i: int64;
  begin
    Result := '[';
    for i := 0 to High(A) do
      Result += IntToStr(A[i]) + ', ';
    Result := Copy(Result, 1, Length(Result) - 2) + ']';
  end;

  procedure DoTest(k: int64; arr: TInt64Array; Expected: int64);
  var
    Actual: int64;
  begin
    Actual := ConsecKprimes(k, arr);
    writeln('k       : ', k);
    writeln('Array   : ', ArrayToString(arr));
    writeln('Expected: ', Expected);
    writeln('Actual  : ', Actual);
    if Expected = Actual then
      writeln('-> OK', LineEnding)
    else
      writeln('-> FAIL', LineEnding);
  end;

begin
  DoTest(2, [10081, 10071, 10077, 10065, 10060, 10070, 10086, 10083,
    10078, 10076, 10089, 10085, 10063, 10074, 10068, 10073, 10072, 10075], 2);
  DoTest(6, [10064], 0);
  DoTest(1, [10054, 10039, 10053, 10051, 10047, 10043, 10037, 10034], 0);
  DoTest(3, [10158, 10182, 10184, 10172, 10179, 10168, 10156, 10165,
    10155, 10161, 10178, 10170], 5);
  DoTest(2, [10110, 10102, 10097, 10113, 10123, 10109, 10118, 10119,
    10117, 10115, 10101, 10121, 10122], 7);
end.
