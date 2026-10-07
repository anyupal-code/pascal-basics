program LogicDemo;

{ Логические операции и сравнения. }

var
  a, b: Integer;
  f1, f2: Boolean;

begin
  a := 5;
  b := 10;

  f1 := (a > 0) and (b > 0);
  f2 := (a = 0) or (b = 0);

  WriteLn('(a > 0) and (b > 0) = ', f1);
  WriteLn('(a = 0) or (b = 0)  = ', f2);
  WriteLn('not (a > 0)         = ', not (a > 0));

  WriteLn('a = b  -> ', a = b);
  WriteLn('a <> b -> ', a <> b);
  WriteLn('a < b  -> ', a < b);
  WriteLn('a >= b -> ', a >= b);
end.