program SumAvg;

{ Сумма и среднее элементов массива. }

const
  N = 10;

var
  a: array[1..N] of Integer;
  i, s: Integer;
  avg: Real;

begin
  WriteLn('Введите ', N, ' чисел:');
  for i := 1 to N do
    Read(a[i]);
  ReadLn;

  s := 0;
  for i := 1 to N do
    s := s + a[i];

  avg := s / N;

  WriteLn('Сумма:   ', s);
  WriteLn('Среднее: ', avg:0:2);
end.