program CountLines;

{ Подсчёт числа строк в файле. }

var
  f: Text;
  s: String;
  count: Integer;

begin
  Assign(f, 'data.txt');
  Reset(f);

  count := 0;
  while not Eof(f) do
  begin
    ReadLn(f, s);
    Inc(count);
  end;

  Close(f);
  WriteLn('Строк в файле: ', count);
end.