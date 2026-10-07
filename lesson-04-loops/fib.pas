program Fibonacci;

{ Выводит первые N чисел Фибоначчи.
  F(1)=0, F(2)=1, F(k)=F(k-1)+F(k-2).
  Ограничение: n <= 92 (иначе переполнение Int64). }

var
  i, n: Integer;
  a, b, c: Int64;

begin
  Write('n = '); ReadLn(n);

  if (n <= 0) or (n > 92) then
  begin
    WriteLn('n должно быть в диапазоне 1..92');
    Exit;
  end;

  a := 0;
  b := 1;

  for i := 1 to n do
  begin
    Write(a, ' ');
    c := a + b;
    a := b;
    b := c;
  end;
  WriteLn;
end.