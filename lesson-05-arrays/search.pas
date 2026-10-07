program SearchDemo;

{ Линейный поиск элемента в массиве. }

const
  N = 10;

var
  a: array[1..N] of Integer;
  i, key, pos: Integer;
  found: Boolean;

begin
  WriteLn('Введите ', N, ' чисел:');
  for i := 1 to N do
    Read(a[i]);
  ReadLn;

  Write('Что искать? '); ReadLn(key);

  found := False;
  pos := 0;
  for i := 1 to N do
    if a[i] = key then
    begin
      found := True;
      pos := i;
      break;
    end;

  if found then
    WriteLn('Найдено в позиции ', pos)
  else
    WriteLn('Не найдено');
end.