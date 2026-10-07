program SumAndAvg;

{ Итоговый пример: сумма и среднее двух чисел. }

var
  a, b, s: Integer;
  avg: Real;

begin
  Write('Введите a: '); ReadLn(a);
  Write('Введите b: '); ReadLn(b);

  s := a + b;
  avg := s / 2;

  WriteLn('Сумма:   ', s);
  WriteLn('Среднее: ', avg:0:2);
end.