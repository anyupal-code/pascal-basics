program ProcedureDemo;

{ Процедуры: с параметром и без. }

procedure Hello;
begin
  WriteLn('Привет из процедуры!');
end;

procedure PrintLine(n: Integer);
var
  i: Integer;
begin
  for i := 1 to n do Write('-');
  WriteLn;
end;

begin
  Hello;
  PrintLine(20);
  Hello;
  PrintLine(10);
end.