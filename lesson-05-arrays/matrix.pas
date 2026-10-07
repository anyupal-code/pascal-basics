program MatrixDemo;

{ Двумерный массив: ввод, вывод, сумма, главная диагональ. }

const
  N = 3;

var
  m: array[1..N, 1..N] of Integer;
  i, j, s, diag: Integer;

begin
  WriteLn('Введите матрицу ', N, 'x', N, ':');
  for i := 1 to N do
    for j := 1 to N do
      Read(m[i, j]);
  ReadLn;

  WriteLn('Матрица:');
  for i := 1 to N do
  begin
    for j := 1 to N do
      Write(m[i, j]:5);
    WriteLn;
  end;

  s := 0;
  for i := 1 to N do
    for j := 1 to N do
      s := s + m[i, j];

  diag := 0;
  for i := 1 to N do
    diag := diag + m[i, i];

  WriteLn('Сумма всех:       ', s);
  WriteLn('Сумма диагонали:  ', diag);
end.