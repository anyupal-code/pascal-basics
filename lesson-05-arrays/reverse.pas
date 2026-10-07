program ReverseArray;

{ Реверс массива на месте. }

const
  N = 7;

var
  a: array[1..N] of Integer;
  i, t: Integer;

begin
  WriteLn('Введите ', N, ' чисел:');
  for i := 1 to N do
    Read(a[i]);
  ReadLn;

  for i := 1 to N div 2 do
  begin
    t := a[i];
    a[i] := a[N - i + 1];
    a[N - i + 1] := t;
  end;

  Write('Реверс: ');
  for i := 1 to N do
    Write(a[i], ' ');
  WriteLn;
end.