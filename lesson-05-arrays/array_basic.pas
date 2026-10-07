program ArrayBasic;

{ Объявление, ввод и вывод одномерного массива. }

const
  N = 5;

var
  a: array[1..N] of Integer;
  i: Integer;

begin
  WriteLn('Введите ', N, ' чисел:');
  for i := 1 to N do
  begin
    Write('a[', i, '] = ');
    ReadLn(a[i]);
  end;

  Write('Массив: ');
  for i := 1 to N do
    Write(a[i], ' ');
  WriteLn;
end.