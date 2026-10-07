program SumNumbers;

{ Сумма чисел, записанных в текстовом файле. }

var
  f: Text;
  n, sum: Integer;

begin
  Assign(f, 'nums.txt');
  Reset(f);

  sum := 0;
  while not Eof(f) do
  begin
    Read(f, n);
    sum := sum + n;
  end;

  Close(f);
  WriteLn('Сумма: ', sum);
end.