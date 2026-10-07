program RecordParams;

{ Запись как параметр: по значению и по ссылке. }

type
  TPoint = record
    x, y: Integer;
  end;

procedure PrintPoint(p: TPoint);
begin
  WriteLn('(', p.x, ', ', p.y, ')');
end;

procedure MovePoint(var p: TPoint; dx, dy: Integer);
begin
  p.x := p.x + dx;
  p.y := p.y + dy;
end;

var
  p: TPoint;

begin
  p.x := 1; p.y := 2;
  Write('До:    '); PrintPoint(p);

  MovePoint(p, 10, 20);
  Write('После: '); PrintPoint(p);
end.