program Nested;

{ Вложенные циклы: таблица умножения. }

var
  i, j: Integer;

begin
  for i := 1 to 9 do
  begin
    for j := 1 to 9 do
      Write(i * j:4);
    WriteLn;
  end;
end.