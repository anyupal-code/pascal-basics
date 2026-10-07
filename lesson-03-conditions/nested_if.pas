program NestedIf;

{ Максимум из трёх чисел через вложенные if. }

var
  a, b, c, max: Integer;

begin
  Write('a b c: '); ReadLn(a, b, c);

  if (a >= b) and (a >= c) then
    max := a
  else if (b >= a) and (b >= c) then
    max := b
  else
    max := c;

  WriteLn('Максимум: ', max);
end.