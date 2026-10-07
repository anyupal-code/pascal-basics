program RepeatDemo;

{ repeat: тело выполнится минимум один раз.
  Суммируем, пока не введут 0. }

var
  x, sum: Integer;

begin
  sum := 0;
  repeat
    Write('x = '); ReadLn(x);
    sum := sum + x;
  until x = 0;

  WriteLn('Сумма: ', sum);
end.