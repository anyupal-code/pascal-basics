program IsPrimeDemo;

{ Функция проверки простого числа. }

function IsPrime(n: Integer): Boolean;
var
  i: Integer;
begin
  if n < 2 then Exit(False);
  i := 2;
  while i * i <= n do
  begin
    if n mod i = 0 then Exit(False);
    Inc(i);
  end;
  IsPrime := True;
end;

var
  n: Integer;

begin
  for n := 1 to 20 do
    if IsPrime(n) then Write(n, ' ');
  WriteLn;
end.