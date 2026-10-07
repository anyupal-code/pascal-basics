program PrimeCheck;

{ Проверка на простое число через while. }

var
  n, i: Integer;
  isPrime: Boolean;

begin
  Write('n = '); ReadLn(n);

  if n < 2 then
    isPrime := False
  else
  begin
    isPrime := True;
    i := 2;
    while i * i <= n do
    begin
      if n mod i = 0 then
      begin
        isPrime := False;
        break;
      end;
      i := i + 1;
    end;
  end;

  if isPrime then WriteLn('Простое')
  else WriteLn('Не простое');
end.