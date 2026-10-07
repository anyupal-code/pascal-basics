program BreakContinue;

{ break: выход из цикла. continue: пропуск итерации. }

var
  i, x, sum: Integer;

begin
  { break: суммируем до первого нуля }
  sum := 0;
  for i := 1 to 100 do
  begin
    Write('x = '); ReadLn(x);
    if x = 0 then break;
    sum := sum + x;
  end;
  WriteLn('Сумма (break): ', sum);

  { continue: только нечётные }
  Write('Нечётные: ');
  for i := 1 to 10 do
  begin
    if i mod 2 = 0 then continue;
    Write(i, ' ');
  end;
  WriteLn;
end.