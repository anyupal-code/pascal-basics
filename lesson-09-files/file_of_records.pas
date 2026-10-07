program FileOfRecords;

{ Типизированный файл записей. }

type
  TPoint = record
    x, y: Integer;
  end;

var
  f: file of TPoint;
  p: TPoint;

begin
  Assign(f, 'points.dat');
  Rewrite(f);

  p.x := 1; p.y := 2; Write(f, p);
  p.x := 3; p.y := 4; Write(f, p);
  p.x := 5; p.y := 6; Write(f, p);

  Close(f);

  Assign(f, 'points.dat');
  Reset(f);

  while not Eof(f) do
  begin
    Read(f, p);
    WriteLn('(', p.x, ', ', p.y, ')');
  end;

  Close(f);
end.