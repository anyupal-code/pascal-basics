# Урок 8. Записи и множества

## Цель

Научиться описывать составные типы данных (`record`) для хранения
связанных полей и работать с множествами (`set`) для быстрых проверок
принадлежности и операций над группами.

## Ключевые понятия

- **Запись (`record`)** — тип, объединяющий несколько полей разных типов.
- **Поле** — именованная часть записи.
- **Множество (`set`)** — неупорядоченный набор уникальных элементов базового типа.
- **`in`** — операция проверки принадлежности.

---

## 1. Записи: объявление

```pascal
type
  TPoint = record
    x, y: Integer;
  end;
```

- `type` — раздел пользовательских типов.
- Внутри `record ... end;` — поля с типами, как переменные.
- Точка с запятой после `end` **обязательна** (завершает описание типа).

### Запись с разными типами полей

```pascal
type
  TStudent = record
    name: String;
    age: Integer;
    avg: Real;
  end;
```

---

## 2. Использование

```pascal
var
  p: TPoint;
  s: TStudent;
begin
  p.x := 3;
  p.y := 5;

  s.name := 'Иван';
  s.age := 18;
  s.avg := 4.5;

  WriteLn(p.x, ', ', p.y);
  WriteLn(s.name, ': ', s.age, ' лет, средний ', s.avg:0:1);
end.
```

- Доступ к полю — через **точку**: `переменная.поле`.
- Поля можно читать и присваивать как обычные переменные.

### Присваивание записей

```pascal
var
  a, b: TPoint;
begin
  a.x := 1; a.y := 2;
  b := a;          { копия всех полей }
  b.x := 100;      { a.x остаётся 1 }
end.
```

Записи одного типа копируются целиком, независимо друг от друга.

---

## 3. Массив записей

```pascal
const
  N = 3;

var
  group: array[1..N] of TStudent;
  i: Integer;
begin
  for i := 1 to N do
  begin
    Write('Имя:  '); ReadLn(group[i].name);
    Write('Возраст: '); ReadLn(group[i].age);
    Write('Средний: '); ReadLn(group[i].avg);
  end;

  for i := 1 to N do
    WriteLn(group[i].name, ', ', group[i].age, ', ', group[i].avg:0:1);
end.
```

Это основа для любой «базы данных» в учебных задачах.

---

## 4. Вложенные записи

```pascal
type
  TPoint = record
    x, y: Integer;
  end;

  TLine = record
    a, b: TPoint;
  end;

var
  l: TLine;
begin
  l.a.x := 0; l.a.y := 0;
  l.b.x := 10; l.b.y := 10;
  WriteLn('(', l.a.x, ',', l.a.y, ') - (', l.b.x, ',', l.b.y, ')');
end.
```

---

## 5. Записи и подпрограммы

Запись передаётся по значению (копия) или по ссылке (`var`).

```pascal
procedure PrintPoint(p: TPoint);
begin
  WriteLn('(', p.x, ', ', p.y, ')');
end;

procedure MovePoint(var p: TPoint; dx, dy: Integer);
begin
  p.x := p.x + dx;
  p.y := p.y + dy;
end;
```

- Без `var` — изменения внутри не сохранятся.
- С `var` — работаем с оригиналом (быстрее и без копирования).

---

## 6. Оператор `with`

Сокращает доступ к полям:

```pascal
with p do
begin
  x := 3;
  y := 5;
end;
```

Эквивалентно:

```pascal
p.x := 3;
p.y := 5;
```

> `with` удобен, но злоупотреблять не стоит: код становится менее явным,
> особенно при вложенных записях.

---

## 7. Множества: объявление

```pascal
type
  TDigits = set of 0..9;
  TLetters = set of 'a'..'z';

var
  s: set of Char;
  d: TDigits;
```

- Базовый тип — **порядковый**: `Char`, целые, диапазон, перечисление.
- Максимум **256** различных значений.
- Нельзя: `set of Integer` (слишком широко), `set of Real`, `set of String`.

---

## 8. Операции над множествами

| Операция           | Знак    | Пример                |
|--------------------|---------|-----------------------|
| Объединение        | `+`     | `s + ['a']`           |
| Пересечение        | `*`     | `s1 * s2`             |
| Разность           | `-`     | `s1 - s2`             |
| Принадлежность     | `in`    | `'a' in s`            |
| Сравнение          | `=`,`<>`| `s1 = s2`             |
| Подмножество       | `<=`,`>=`| `s1 <= s2`           |

### Примеры

```pascal
var
  s, t: set of Char;
begin
  s := ['a', 'b', 'c'];
  t := ['b', 'c', 'd'];

  WriteLn('a in s: ', 'a' in s);         { True }
  WriteLn('объединение: ', s + t = ['a','b','c','d']);
  WriteLn('пересечение: ', s * t = ['b','c']);
  WriteLn('разность:    ', s - t = ['a']);
end.
```

### Пустое множество и добавление

```pascal
s := [];              { пустое }
s := s + ['x'];       { добавить }
s := s - ['x'];       { удалить }
```

### Заполнение из строки

```pascal
var
  s: String;
  letters: set of Char;
  i: Integer;
begin
  ReadLn(s);
  letters := [];
  for i := 1 to Length(s) do
    letters := letters + [s[i]];
end.
```

---

## 9. Сколько элементов в множестве

Прямой функции нет — считают перебором:

```pascal
function CountSet(const s: set of Char): Integer;
var
  c: Char;
  n: Integer;
begin
  n := 0;
  for c := #0 to #255 do
    if c in s then Inc(n);
  CountSet := n;
end;
```

Или через базовый диапазон конкретного типа:

```pascal
for c := 'a' to 'z' do
  if c in s then Inc(n);
```

---

## 10. Типичные задачи

### Уникальные символы строки

```pascal
function UniqueChars(s: String): String;
var
  seen: set of Char;
  i: Integer;
  r: String;
begin
  seen := [];
  r := '';
  for i := 1 to Length(s) do
    if not (s[i] in seen) then
    begin
      seen := seen + [s[i]];
      r := r + s[i];
    end;
  UniqueChars := r;
end;
```

### Проверка «все ли символы — цифры»

```pascal
function AllDigits(s: String): Boolean;
var
  i: Integer;
begin
  AllDigits := True;
  for i := 1 to Length(s) do
    if not (s[i] in ['0'..'9']) then
    begin
      AllDigits := False;
      Exit;
    end;
end;
```

### Подсчёт разных букв

```pascal
var
  s: String;
  letters: set of Char;
  i, count: Integer;
  c: Char;
begin
  ReadLn(s);
  letters := [];
  for i := 1 to Length(s) do
    if (s[i] >= 'a') and (s[i] <= 'z') then
      letters := letters + [s[i]];

  count := 0;
  for c := 'a' to 'z' do
    if c in letters then Inc(count);
  WriteLn('Разных букв: ', count);
end.
```

### Телефонная книга (массив записей)

```pascal
type
  TContact = record
    name: String;
    phone: String;
  end;

var
  book: array[1..100] of TContact;
  n, i: Integer;
begin
  Write('Сколько контактов? '); ReadLn(n);
  for i := 1 to n do
  begin
    Write('Имя:   '); ReadLn(book[i].name);
    Write('Телефон: '); ReadLn(book[i].phone);
  end;

  for i := 1 to n do
    WriteLn(book[i].name, ': ', book[i].phone);
end.
```

---

## 11. Частые ошибки

- **Забыли `;` после `end` описания записи** — ошибка компиляции.
  ```pascal
  type
    TPoint = record
      x, y: Integer;
    end;    { ← точка с запятой обязательна }
  ```
- **Обращение к полю через `.` без переменной** — `TStudent.name` нельзя.
- **`set of Integer`** — не компилируется: базовый тип слишком широк.
- **Изменение записи без `var`-параметра** — изменения теряются.
- **Путаница `=` и `in`** — `s[i] = 'a'` сравнение символа, `'a' in s` проверка множества.

---

## Примеры

- [record_basic.pas](record_basic.pas) — объявление, поля, присваивание
- [record_array.pas](record_array.pas) — массив записей, ввод/вывод
- [record_params.pas](record_params.pas) — запись в параметрах процедур
- [nested_record.pas](nested_record.pas) — вложенные записи
- [set_basic.pas](set_basic.pas) — операции над множествами
- [set_chars.pas](set_chars.pas) — уникальные символы, классификация
- [phonebook.pas](phonebook.pas) — массив записей как мини-база

## Запуск

**Pascal ABC:** открыть файл, F9.

**Free Pascal:**

```bash
fpc record_basic.pas
./record_basic
```

## Что дальше

Урок 9 — файлы.