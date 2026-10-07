program TextRead;

{ Чтение строк из текстового файла. }

var
  f: Text;
  s: String;

begin
  Assign(f, 'data.txt');
  Reset(f);

  while not Eof(f) do
  begin
    ReadLn(f, s);
    WriteLn(s);
  end;

  Close(f);
end.