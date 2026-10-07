program NestedRecord;

{ Вложенные записи: отрезок из двух точек. }

type
  TPoint = record
    x, y: Integer;
  end;

  TLine = record
    a, b: TPoint;
  end;

var
  l: TLine;

begin
  l.a.x := 0;  l.a.y := 0;
  l.b.x := 10; l.b.y := 10;

  WriteLn('Отрезок: (', l.a.x, ',', l.a.y, ') - (', l.b.x, ',', l.b.y, ')');
end.