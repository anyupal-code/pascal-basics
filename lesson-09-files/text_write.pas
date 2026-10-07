program TextWrite;

{ Запись строк в текстовый файл. }

var
  f: Text;

begin
  Assign(f, 'data.txt');
  Rewrite(f);

  WriteLn(f, 'Первая строка');
  WriteLn(f, 'Вторая строка');
  WriteLn(f, 'Третья строка');

  Close(f);
  WriteLn('Файл data.txt создан');
end.