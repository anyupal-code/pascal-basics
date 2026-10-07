program RecordArray;

{ Массив записей: ввод, вывод. }

const
  N = 3;

type
  TStudent = record
    name: String;
    age: Integer;
    avg: Real;
  end;

var
  group: array[1..N] of TStudent;
  i: Integer;

begin
  for i := 1 to N do
  begin
    Write('Имя:     '); ReadLn(group[i].name);
    Write('Возраст: '); ReadLn(group[i].age);
    Write('Средний: '); ReadLn(group[i].avg);
  end;

  WriteLn;
  WriteLn('Список:');
  for i := 1 to N do
    WriteLn(group[i].name, ', ', group[i].age, ' лет, ср. ', group[i].avg:0:2);
end.