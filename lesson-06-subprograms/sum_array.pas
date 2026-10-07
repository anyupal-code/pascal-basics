program SumArrayDemo;

{ Открытый массив: принимает массивы любого размера. }

type
  TArr = array of Integer;

function SumArr(const a: TArr): Integer;
var
  i, s: Integer;
begin
  s := 0;
  for i := Low(a) to High(a) do
    s := s + a[i];
  SumArr := s;
end;

var
  x: TArr;
  n, i: Integer;

begin
  Write('n = '); ReadLn(n);

  SetLength(x, n);
  for i := 0 to n - 1 do
  begin
    Write('x[', i, '] = ');
    ReadLn(x[i]);
  end;

  WriteLn('Сумма = ', SumArr(x));
end.