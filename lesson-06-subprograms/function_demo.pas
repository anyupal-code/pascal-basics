program FunctionDemo;

{ Функции: сложение, максимум, квадрат. }

function Sum(a, b: Integer): Integer;
begin
  Sum := a + b;
end;

function Max(a, b: Integer): Integer;
begin
  if a > b then Max := a
  else Max := b;
end;

function Square(x: Integer): Integer;
begin
  Square := x * x;
end;

begin
  WriteLn('Sum(3, 5)    = ', Sum(3, 5));
  WriteLn('Max(10, 7)   = ', Max(10, 7));
  WriteLn('Square(4)    = ', Square(4));
  WriteLn('Sum + Square = ', Sum(Square(3), 1));
end.