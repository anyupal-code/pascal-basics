# Урок 7. Строки и символы

## Цель

Научиться обрабатывать текстовые данные: работать с отдельными символами
и строками, искать, извлекать, вставлять и удалять фрагменты,
преобразовывать числа в строки и обратно.

## Ключевые понятия

- **`Char`** — один символ.
- **`String`** — последовательность символов.
- **Индексация** — символы нумеруются с `1`.
- **`Length(s)`** — длина строки.
- **`s[i]`** — i-й символ.
- **Конкатенация** — склейка строк через `+`.

---

## 1. Типы `Char` и `String`

```pascal
var
  c: Char;
  s: String;
begin
  c := 'A';
  s := 'Pascal';
end.
```

- `Char` — ровно один символ в **одинарных** кавычках.
- `String` — от 0 до 2 ГБ символов.
- `String[N]` — короткая строка, максимум `N` символов.

---

## 2. Базовые операции

```pascal
s := 'Hello';
s := s + ', World!';    { конкатенация }
WriteLn(s);
WriteLn(Length(s));     { длина }
WriteLn(s[1]);          { 'H' }
s[1] := 'h';            { замена символа: 'hello, World!' }
```

- Строки сравниваются лексикографически: `'abc' < 'abd'`, `'A' < 'a'`.
- Операторы: `=`, `<>`, `<`, `>`, `<=`, `>=`.

---

## 3. Основные функции и процедуры

| Действие | Вызов |
|---|---|
| Длина | `Length(s)` |
| Копия фрагмента | `Copy(s, pos, count)` |
| Удалить фрагмент | `Delete(s, pos, count)` |
| Вставить | `Insert(sub, s, pos)` |
| Позиция подстроки | `Pos(sub, s)` |
| Верхний регистр | `UpCase(c)` |
| Число → строка | `IntToStr(n)` |
| Строка → число | `StrToInt(s)` |
| Проверка на число | `TryStrToInt(s, n)` |

> `TryStrToInt` есть в PascalABC.NET и Free Pascal (через `SysUtils`).
> В классическом Pascal ABC используйте `Val(s, n, code)`.

### Примеры

```pascal
s := 'Pascal';
Delete(s, 1, 1);         { 'ascal' }
Insert('Pro', s, 1);     { 'Proascal' }
t := Copy(s, 1, 3);      { 'Pro' }
p := Pos('cal', s);      { 5 }
c := UpCase('a');        { 'A' }
```

**Важно:** `Delete` и `Insert` меняют строку **на месте**,
`Copy` и `Pos` возвращают результат.

---

## 4. Обход строки в цикле

```pascal
var
  s: String;
  i, count: Integer;
begin
  s := 'banana';
  count := 0;
  for i := 1 to Length(s) do
    if s[i] = 'a' then Inc(count);
  WriteLn('Букв a: ', count);
end.
```

Индексация — с `1` до `Length(s)`.

---

## 5. Преобразование чисел и строк

### Число → строка

```pascal
var
  n: Integer;
  s: String;
begin
  n := 42;
  s := IntToStr(n);        { '42' }
  s := 'x = ' + IntToStr(n);
end.
```

### Строка → число

```pascal
var
  n: Integer;
  s: String;
begin
  s := '123';
  n := StrToInt(s);        { 123 }
end.
```

### Безопасное преобразование — `Val`

```pascal
var
  n, code: Integer;
  s: String;
begin
  s := 'abc';
  Val(s, n, code);
  if code = 0 then WriteLn('Число: ', n)
  else WriteLn('Не число, ошибка в позиции ', code);
end.
```

`code = 0` — успех, иначе — позиция первой ошибочной цифры.

---

## 6. Символы и коды

```pascal
var
  c: Char;
  code: Integer;
begin
  c := 'A';
  code := Ord(c);          { 65 }
  c := Chr(66);            { 'B' }

  if (c >= 'a') and (c <= 'z') then
    WriteLn('строчная буква');
end.
```

- `Ord(c)` — код символа.
- `Chr(n)` — символ по коду.
- Символы сравниваются по коду: `'0' < '9' < 'A' < 'Z' < 'a' < 'z'`.

---

## 7. Типичные задачи

### Переворот строки

```pascal
function Reverse(s: String): String;
var
  i: Integer;
  r: String;
begin
  r := '';
  for i := Length(s) downto 1 do
    r := r + s[i];
  Reverse := r;
end;
```

### Палиндром

```pascal
function IsPalindrome(s: String): Boolean;
var
  i: Integer;
begin
  IsPalindrome := True;
  for i := 1 to Length(s) div 2 do
    if s[i] <> s[Length(s) - i + 1] then
    begin
      IsPalindrome := False;
      Exit;
    end;
end;
```

### Подсчёт слов

```pascal
function CountWords(s: String): Integer;
var
  i, count: Integer;
  inWord: Boolean;
begin
  count := 0;
  inWord := False;
  for i := 1 to Length(s) do
    if s[i] <> ' ' then
    begin
      if not inWord then
      begin
        Inc(count);
        inWord := True;
      end;
    end
    else
      inWord := False;
  CountWords := count;
end;
```

### Заглавные буквы

```pascal
function ToUpper(s: String): String;
var
  i: Integer;
begin
  for i := 1 to Length(s) do
    s[i] := UpCase(s[i]);
  ToUpper := s;
end;
```

### Удалить пробелы

```pascal
function NoSpaces(s: String): String;
var
  i: Integer;
  r: String;
begin
  r := '';
  for i := 1 to Length(s) do
    if s[i] <> ' ' then r := r + s[i];
  NoSpaces := r;
end;
```

---

## 8. Частые ошибки

- **Индексация с 0** — в Pascal строки нумеруются с `1`.
  `s[0]` — ошибка.
- **Выход за границы** — `s[Length(s) + 1]` недопустимо.
- **`Val` с нулевым результатом** — не забывайте проверять `code`.
- **Путаница `Delete` и `Copy`** — `Delete` меняет строку, `Copy` возвращает новую.
- **Сравнение `Char` и `String`** — `s[1] = 'A'` корректно, `s = 'A'` тоже (если длина 1).

---

## Примеры

- [strings_basic.pas](strings_basic.pas) — объявление, длина, индексация, конкатенация
- [string_ops.pas](string_ops.pas) — `Copy`, `Delete`, `Insert`, `Pos`
- [case_convert.pas](case_convert.pas) — `UpCase`, смена регистра
- [reverse.pas](reverse.pas) — переворот строки
- [palindrome.pas](palindrome.pas) — проверка палиндрома
- [count_words.pas](count_words.pas) — подсчёт слов
- [parse_number.pas](parse_number.pas) — `IntToStr`, `StrToInt`, `Val`
- [char_codes.pas](char_codes.pas) — `Ord`, `Chr`, классификация символов

## Запуск

**Pascal ABC:** открыть файл, F9.

**Free Pascal:**

```bash
fpc strings_basic.pas
./strings_basic
```

## Что дальше

Урок 8 — записи и множества.