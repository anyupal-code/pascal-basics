program ArithmeticDemo;

{ Арифметические операции и их приоритет. }

var
  a, b: Integer;
  x, y: Real;

begin
  a := 7;
  b := 2;

  WriteLn('a + b  = ', a + b);
  WriteLn('a - b  = ', a - b);
  WriteLn('a * b  = ', a * b);
  WriteLn('a / b  = ', a / b:0:3);     { вещественное деление }
  WriteLn('a div b= ', a div b);       { целочисленное }
  WriteLn('a mod b= ', a mod b);       { остаток }

  x := 2 + 3 * 4;
  y := (2 + 3) * 4;
  WriteLn('2 + 3 * 4   = ', x:0:0);
  WriteLn('(2 + 3) * 4 = ', y:0:0);

  WriteLn('Abs(-5)    = ', Abs(-5));
  WriteLn('Sqr(4)     = ', Sqr(4));
  WriteLn('Sqrt(16)   = ', Sqrt(16):0:1);
  WriteLn('Round(3.6) = ', Round(3.6));
  WriteLn('Trunc(3.6) = ', Trunc(3.6));
end.