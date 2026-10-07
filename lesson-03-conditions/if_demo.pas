program IfDemo;

{ Полная и краткая формы if. }

var
  x: Integer;

begin
  Write('x = '); ReadLn(x);

  if x > 0 then
    WriteLn('Положительное')
  else
    WriteLn('Не положительное');

  if x = 0 then
    WriteLn('Ровно ноль');
end.