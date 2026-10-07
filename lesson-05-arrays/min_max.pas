program MinMax;

{ Минимум и максимум массива. }

const
  N = 10;

var
  a: array[1..N] of Integer;
  i, mn, mx: Integer;

begin
  WriteLn('Введите ', N, ' чисел:');
  for i := 1 to N do
    Read(a[i]);
  ReadLn;

  mn := a[1];
  mx := a[1];
  for i := 2 to N do
  begin
    if a[i] < mn then mn := a[i];
    if a[i] > mx then mx := a[i];
  end;

  WriteLn('Минимум:  ', mn);
  WriteLn('Максимум: ', mx);
end.