program RecordBasic;

{ Объявление записи, работа с полями, копирование. }

type
  TPoint = record
    x, y: Integer;
  end;

var
  a, b: TPoint;

begin
  a.x := 3;
  a.y := 5;
  WriteLn('a = (', a.x, ', ', a.y, ')');

  b := a;          { копия всех полей }
  b.x := 100;

  WriteLn('a = (', a.x, ', ', a.y, ')');
  WriteLn('b = (', b.x, ', ', b.y, ')');
end.