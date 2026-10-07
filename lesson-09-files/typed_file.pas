program TypedFile;

{ Типизированный файл целых чисел. }

var
  f: file of Integer;
  x, i: Integer;

begin
  Assign(f, 'nums.dat');
  Rewrite(f);
  for i := 1 to 5 do
    Write(f, i * 10);
  Close(f);

  Assign(f, 'nums.dat');
  Reset(f);
  while not Eof(f) do
  begin
    Read(f, x);
    Write(x, ' ');
  end;
  Close(f);
  WriteLn;
end.