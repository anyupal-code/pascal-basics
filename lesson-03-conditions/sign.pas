program SignParity;

{ Знак числа и чётность. }

var
  x: Integer;

begin
  Write('x = '); ReadLn(x);

  if x > 0 then WriteLn('Знак: +')
  else if x < 0 then WriteLn('Знак: -')
  else WriteLn('Это ноль');

  if x mod 2 = 0 then WriteLn('Чётное')
  else WriteLn('Нечётное');
end.