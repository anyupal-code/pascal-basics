program ForDemo;

{ Прямой и обратный цикл for. }

var
  i: Integer;

begin
  WriteLn('Прямой счёт:');
  for i := 1 to 5 do
    Write(i, ' ');
  WriteLn;

  WriteLn('Обратный счёт:');
  for i := 5 downto 1 do
    Write(i, ' ');
  WriteLn;
end.