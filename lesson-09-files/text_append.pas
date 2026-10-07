program TextAppend;

{ Дозапись в конец текстового файла. }

var
  f: Text;
  s: String;

begin
  Assign(f, 'data.txt');
  Append(f);

  Write('Строка для добавления: '); ReadLn(s);
  WriteLn(f, s);

  Close(f);
  WriteLn('Добавлено');
end.