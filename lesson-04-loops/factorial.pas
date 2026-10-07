program Factorial;

{ Факториал N! через for. }

var
  i, n: Integer;
  f: Int64;

begin
  Write('n = '); ReadLn(n);

  f := 1;
  for i := 1 to n do
    f := f * i;

  WriteLn(n, '! = ', f);
end.