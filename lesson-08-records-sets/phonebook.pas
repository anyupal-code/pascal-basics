program PhoneBook;

{ Массив записей как мини-база контактов. }

const
  MAX = 5;

type
  TContact = record
    name: String;
    phone: String;
  end;

var
  book: array[1..MAX] of TContact;
  n, i: Integer;
  query: String;
  found: Boolean;

begin
  Write('Сколько контактов? '); ReadLn(n);
  if n > MAX then n := MAX;

  for i := 1 to n do
  begin
    Write('Имя:     '); ReadLn(book[i].name);
    Write('Телефон: '); ReadLn(book[i].phone);
  end;

  Write('Найти по имени: '); ReadLn(query);

  found := False;
  for i := 1 to n do
    if book[i].name = query then
    begin
      WriteLn('Телефон: ', book[i].phone);
      found := True;
      break;
    end;

  if not found then
    WriteLn('Не найдено');
end.