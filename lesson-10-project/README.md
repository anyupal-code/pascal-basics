# Урок 10. Итоговый проект: телефонный справочник

## Цель

Собрать всё изученное — массивы, записи, подпрограммы, строки, файлы —
в одну работающую программу с меню.

## Что должен уметь проект

- Добавлять контакты (имя + телефон).
- Показывать список всех контактов.
- Искать контакт по имени (частичное совпадение).
- Удалять контакт.
- Сохранять базу в файл.
- Загружать базу из файла при запуске.

## Ключевые темы курса в проекте

| Тема | Где используется |
|---|---|
| Записи | `TContact` — одна запись базы |
| Массивы | `array of TContact` — сама база |
| Процедуры и функции | добавление, поиск, удаление, вывод, сохранение |
| Строки | поиск по подстроке через `Pos` |
| Файлы | сохранение/загрузка через `Text` |
| Циклы и ветвления | меню, перебор базы, обработка выбора |

---

## Структура программы

```
program PhoneBook;

type
  TContact = record
    name:  String;
    phone: String;
  end;

  TBook = array of TContact;   { динамический массив }

const
  FILE_NAME = 'phonebook.txt';

{ --- Подпрограммы --- }

procedure LoadBook(var b: TBook);
procedure SaveBook(const b: TBook);
procedure AddContact(var b: TBook);
procedure ListContacts(const b: TBook);
procedure FindContact(const b: TBook);
procedure DeleteContact(var b: TBook);
procedure PrintMenu;

{ --- Основная программа --- }

begin
  ...
end.
```

---

## 1. Типы и данные

```pascal
type
  TContact = record
    name:  String;
    phone: String;
  end;

  TBook = array of TContact;

var
  book: TBook;
```

- `TContact` — одна запись.
- `TBook` — динамический массив записей, растёт по мере добавления.
- `SetLength(book, Length(book) + 1)` — увеличить на один.

---

## 2. Загрузка из файла

Формат файла — две строки на контакт:

```
Иван
+7-900-123-45-67
Мария
+7-900-765-43-21
```

```pascal
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
```

> `FileExists` доступен в PascalABC.NET и Free Pascal.
> В классическом Pascal ABC подключите модуль `Files` или используйте `{$I-}` / `IOResult`.

---

## 3. Сохранение в файл

```pascal
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
end.
```

`const b: TBook` — передача без копирования, изменять не разрешено.

---

## 4. Добавление контакта

```pascal
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
end.
```

`var b: TBook` — изменяем массив, поэтому по ссылке.

---

## 5. Вывод списка

```pascal
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
end.
```

---

## 6. Поиск по имени

```pascal
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
end.
```

- `Pos(query, name)` — позиция подстроки, `0` — не найдено.
- Поиск **без учёта регистра** — можно добавить `UpCase` при сравнении.

---

## 7. Удаление контакта

```pascal
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
      { сдвигаем все элементы после i на одну позицию влево }
      for j := i to High(b) - 1 do
        b[j] := b[j + 1];
      SetLength(b, Length(b) - 1);
      found := True;
      WriteLn('Удалено');
      break;
    end;

  if not found then
    WriteLn('Не найдено');
end.
```

---

## 8. Меню

```pascal
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
```

---

## 9. Основная программа

```pascal
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
```

---

## 10. Что проверяется в проекте

- Корректная работа всех пунктов меню.
- Разбиение на подпрограммы — не «всё в main».
- Разделение параметров: `var` где нужно менять, `const` где только читаем.
- Проверка граничных случаев: пустая база, пустой ввод, неверный пункт меню.
- Сохранение и загрузка файла без потерь.

## Возможные расширения

- Сортировка контактов по имени (`for i := ... for j := ...`).
- Поиск по части номера.
- Несколько телефонов на контакт (массив строк в записи).
- Группы/категории контактов.
- Экспорт в CSV.
- Замена линейного поиска на бинарный (после сортировки).

---

## Примеры

- [phonebook.pas](phonebook.pas) — полная реализация проекта

## Запуск

**Pascal ABC:** открыть файл, F9.

**Free Pascal:**

```bash
fpc phonebook.pas
./phonebook
```

Файл `phonebook.txt` создаётся рядом с бинарником.

## Что дальше

Курс завершён. Дальше — самостоятельно: ООП (классы в Object Pascal),
модули, динамические структуры (списки), работа с графикой (GraphABC),
базы данных, веб (fpWeb), GUI (Lazarus).