program GCDDemo;

{ НОД двумя способами: цикл и рекурсия. }

function GCDIter(a, b: Integer): Integer;
var
  t: Integer;
begin
  while b <> 0 do
  begin
    t := b;
    b := a mod b;
    a := t;
  end;
  GCDIter := a;
end;

function GCDRec(a, b: Integer): Integer;
begin
  if b = 0 then GCDRec := a
  else GCDRec := GCDRec(b, a mod b);
end;

var
  a, b: Integer;

begin
  Write('a b: '); ReadLn(a, b);
  WriteLn('НОД (цикл):     ', GCDIter(a, b));
  WriteLn('НОД (рекурсия): ', GCDRec(a, b));
end.