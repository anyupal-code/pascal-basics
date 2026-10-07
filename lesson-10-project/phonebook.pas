program PhoneBook;

{ Итоговый проект: телефонный справочник.
  Демонстрирует: записи, динамические массивы, подпрограммы,
  строки, файлы, меню. }

const
  FILE_NAME = 'phonebook.txt';

type
  TContact = record
    name:  String;
    phone: String;
  end;

  TBook = array of TContact;

{ --- Загрузка из файла --- }
procedure LoadBook(var b: TBook);
var
  f: Text;
  name, phone: String;
begin
  SetLength(b, 0);
  if not FileExists(FILE_NAME) then Exit;

  Assign(f, FILE_NAME);
  Reset(f);

  while not Eof(f) do
  begin
    ReadLn(f, name);
    if Eof(f) then break;
    ReadLn(f, phone);

    SetLength(b, Length(b) + 1);
    b[High(b)].name  := name;
    b[High(b)].phone := phone;
  end;

  Close(f);
end;

{ --- Сохранение в файл --- }
procedure SaveBook(const b: TBook);
var
  f: Text;
  i: Integer;
begin
  Assign(f, FILE_NAME);
  Rewrite(f);

  for i := 0 to High(b) do
  begin
    WriteLn(f, b[i].name);
    WriteLn(f, b[i].phone);
  end;

  Close(f);
end;

{ --- Добавление контакта --- }
procedure AddContact(var b: TBook);
var
  c: TContact;
begin
  Write('Имя:     '); ReadLn(c.name);
  Write('Телефон: '); ReadLn(c.phone);

  if (c.name = '') or (c.phone = '') then
  begin
    WriteLn('Пустые поля недопустимы');
    Exit;
  end;

  SetLength(b, Length(b) + 1);
  b[High(b)] := c;
  WriteLn('Контакт добавлен');
end;

{ --- Вывод списка --- }
procedure ListContacts(const b: TBook);
var
  i: Integer;
begin
  if Length(b) = 0 then
  begin
    WriteLn('Справочник пуст');
    Exit;
  end;

  for i := 0 to High(b) do
    WriteLn(i + 1, '. ', b[i].name, ' — ', b[i].phone);
end;

{ --- Поиск по имени --- }
procedure FindContact(const b: TBook);
var
  query: String;
  i, found: Integer;
begin
  Write('Что искать: '); ReadLn(query);
  found := 0;

  for i := 0 to High(b) do
    if Pos(query, b[i].name) > 0 then
    begin
      WriteLn(b[i].name, ' — ', b[i].phone);
      Inc(found);
    end;

  if found = 0 then
    WriteLn('Не найдено')
  else
    WriteLn('Найдено: ', found);
end;

{ --- Удаление контакта --- }
procedure DeleteContact(var b: TBook);
var
  query: String;
  i, j: Integer;
  found: Boolean;
begin
  Write('Кого удалить: '); ReadLn(query);
  found := False;

  for i := 0 to High(b) do
    if b[i].name = query then
    begin
      for j := i to High(b) - 1 do
        b[j] := b[j + 1];
      SetLength(b, Length(b) - 1);
      found := True;
      WriteLn('Удалено');
      break;
    end;

  if not found then
    WriteLn('Не найдено');
end;

{ --- Меню --- }
procedure PrintMenu;
begin
  WriteLn;
  WriteLn('=== Телефонный справочник ===');
  WriteLn('1. Показать все контакты');
  WriteLn('2. Добавить контакт');
  WriteLn('3. Найти контакт');
  WriteLn('4. Удалить контакт');
  WriteLn('5. Сохранить и выйти');
  Write('Выбор: ');
end;

{ --- Основная программа --- }
var
  book: TBook;
  choice: Integer;

begin
  LoadBook(book);

  repeat
    PrintMenu;
    ReadLn(choice);

    case choice of
      1: ListContacts(book);
      2: AddContact(book);
      3: FindContact(book);
      4: DeleteContact(book);
      5: begin
           SaveBook(book);
           WriteLn('До свидания');
         end;
    else
      WriteLn('Неверный пункт');
    end;

  until choice = 5;
end.