program TextCopy;

{ Копирование текстового файла. }

var
  fin, fout: Text;
  s: String;

begin
  Assign(fin, 'in.txt');
  Reset(fin);

  Assign(fout, 'out.txt');
  Rewrite(fout);

  while not Eof(fin) do
  begin
    ReadLn(fin, s);
    WriteLn(fout, s);
  end;

  Close(fin);
  Close(fout);
  WriteLn('Скопировано');
end.