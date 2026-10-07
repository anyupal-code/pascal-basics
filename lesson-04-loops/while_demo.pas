program WhileDemo;

{ Сумма цифр числа: число итераций неизвестно заранее. }

var
  n, s: Integer;

begin
  Write('n = '); ReadLn(n);

  s := 0;
  while n > 0 do
  begin
    s := s + n mod 10;
    n := n div 10;
  end;

  WriteLn('Сумма цифр: ', s);
end.