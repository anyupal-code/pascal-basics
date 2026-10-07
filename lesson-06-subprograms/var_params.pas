program VarParams;

{ Параметры по значению и по ссылке (var). }

procedure BadInc(x: Integer);
begin
  x := x + 1;    { меняется только копия }
end;

procedure GoodInc(var x: Integer);
begin
  x := x + 1;    { меняется оригинал }
end;

procedure Swap(var a, b: Integer);
var
  t: Integer;
begin
  t := a; a := b; b := t;
end;

var
  a, b: Integer;

begin
  a := 5;
  BadInc(a);
  WriteLn('После BadInc:  a = ', a);   { 5 }

  GoodInc(a);
  WriteLn('После GoodInc: a = ', a);   { 6 }

  b := 10;
  WriteLn('До Swap:    a = ', a, ', b = ', b);
  Swap(a, b);
  WriteLn('После Swap: a = ', a, ', b = ', b);
end.