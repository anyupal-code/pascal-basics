program RecursionDemo;

{ Рекурсия: факториал, Фибоначчи, быстрое возведение в степень. }

function Fact(n: Integer): Int64;
begin
  if n <= 1 then Fact := 1
  else Fact := n * Fact(n - 1);
end;

function Fib(n: Integer): Int64;
begin
  if n <= 1 then Fib := n
  else Fib := Fib(n - 1) + Fib(n - 2);
end;

function Pow(a, n: Int64): Int64;
var
  t: Int64;
begin
  if n = 0 then Pow := 1
  else if n mod 2 = 0 then
  begin
    t := Pow(a, n div 2);
    Pow := t * t;
  end
  else
    Pow := a * Pow(a, n - 1);
end;

var
  i: Integer;

begin
  WriteLn('5! = ', Fact(5));
  WriteLn('10! = ', Fact(10));

  Write('Fib: ');
  for i := 0 to 10 do
    Write(Fib(i), ' ');
  WriteLn;

  WriteLn('2^10 = ', Pow(2, 10));
  WriteLn('3^5  = ', Pow(3, 5));
end.