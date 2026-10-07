program ScopeDemo;

{ Глобальные и локальные переменные. }

var
  x: Integer;   { глобальная }

procedure P;
var
  x: Integer;   { локальная, затеняет глобальную }
begin
  x := 100;
  WriteLn('Внутри P: x = ', x);
end;

begin
  x := 5;
  WriteLn('До P:     x = ', x);

  P;

  WriteLn('После P:  x = ', x);   { всё ещё 5 }
end.