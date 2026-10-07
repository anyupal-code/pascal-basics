program Calculator;

{ Мини-калькулятор: два числа и операция. }

var
  a, b, res: Real;
  op: Char;

begin
  Write('a = '); ReadLn(a);
  Write('b = '); ReadLn(b);
  Write('Операция (+ - * /): '); ReadLn(op);

  case op of
    '+': begin res := a + b; WriteLn('= ', res:0:2); end;
    '-': begin res := a - b; WriteLn('= ', res:0:2); end;
    '*': begin res := a * b; WriteLn('= ', res:0:2); end;
    '/':
      if b <> 0 then
        begin res := a / b; WriteLn('= ', res:0:2); end
      else
        WriteLn('Деление на ноль!');
  else
    WriteLn('Неизвестная операция');
  end;
end.