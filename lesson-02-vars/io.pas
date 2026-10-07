program IODemo;

{ Ввод и вывод: Write/WriteLn, ReadLn, форматирование. }

var
  name: String;
  age: Integer;
  height: Real;

begin
  Write('Как вас зовут? '); ReadLn(name);
  Write('Сколько вам лет? '); ReadLn(age);
  Write('Ваш рост (см)? '); ReadLn(height);

  WriteLn;
  WriteLn('Привет, ', name, '!');
  WriteLn('Возраст: ', age);
  WriteLn('Рост:    ', height:0:2, ' см');
end.