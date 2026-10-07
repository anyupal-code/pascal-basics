# Урок 9. Файлы

## Цель

Научиться сохранять данные между запусками программы: читать и записывать
текстовые и типизированные файлы, обрабатывать содержимое построчно.

## Ключевые понятия

- **Файловая переменная** — переменная типа `Text` или `file of T`.
- **`Assign`** — связать файловую переменную с именем файла.
- **`Rewrite`** — создать/перезаписать файл.
- **`Reset`** — открыть файл для чтения.
- **`Append`** — открыть текстовый файл для дозаписи.
- **`Close`** — закрыть файл.
- **`Eof(f)`** — достигнут ли конец файла.

---

## 1. Виды файлов в Pascal

| Вид | Тип | Что хранит |
|---|---|---|
| Текстовый | `Text` | строки символов |
| Типизированный | `file of T` | значения одного типа `T` |
| Нетипизированный | `file` | блоки байт (редко в базовом курсе) |

В этом уроке — первые два.

---

## 2. Порядок работы с файлом

1. `Assign(f, 'имя')` — связать переменную с файлом.
2. Открыть: `Rewrite` (запись), `Reset` (чтение), `Append` (дозапись).
3. Читать / писать.
4. `Close(f)` — закрыть обязательно.

> **Всегда закрывайте файл.** Иначе данные могут не сохраниться,
> а файл останется заблокированным для других программ.

---

## 3. Текстовые файлы

### Запись

```pascal
var
  f: Text;
begin
  Assign(f, 'data.txt');
  Rewrite(f);
  WriteLn(f, 'Первая строка');
  WriteLn(f, 'Вторая строка');
  Close(f);
end.
```

- `Write(f, ...)` — без перевода строки.
- `WriteLn(f, ...)` — с переводом строки.

### Чтение

```pascal
var
  f: Text;
  s: String;
begin
  Assign(f, 'data.txt');
  Reset(f);
  while not Eof(f) do
  begin
    ReadLn(f, s);
    WriteLn(s);
  end;
  Close(f);
end.
```

- `Eof(f)` — `True`, когда достигнут конец.
- `ReadLn(f, s)` — читает строку.

### Дозапись в конец

```pascal
Assign(f, 'data.txt');
Append(f);                  { только для Text }
WriteLn(f, 'Третья строка');
Close(f);
```

---

## 4. Типизированные файлы

Хранят значения одного типа — числа, записи и т.п.

```pascal
var
  f: file of Integer;
  x, i: Integer;
begin
  Assign(f, 'nums.dat');
  Rewrite(f);
  for i := 1 to 5 do
    Write(f, i * 10);
  Close(f);

  Assign(f, 'nums.dat');
  Reset(f);
  while not Eof(f) do
  begin
    Read(f, x);
    WriteLn(x);
  end;
  Close(f);
end.
```

- `Read(f, x)` / `Write(f, x)` — без `Ln`.
- Данные хранятся в бинарном виде.

### Файл записей

```pascal
type
  TPoint = record
    x, y: Integer;
  end;

var
  f: file of TPoint;
  p: TPoint;
begin
  Assign(f, 'points.dat');
  Rewrite(f);
  p.x := 1; p.y := 2; Write(f, p);
  p.x := 3; p.y := 4; Write(f, p);
  Close(f);

  Assign(f, 'points.dat');
  Reset(f);
  while not Eof(f) do
  begin
    Read(f, p);
    WriteLn('(', p.x, ', ', p.y, ')');
  end;
  Close(f);
end.
```

---

## 5. Режимы открытия

| Процедура | Что делает |
|---|---|
| `Rewrite(f)` | создаёт заново / очищает существующий |
| `Reset(f)` | открывает для чтения |
| `Append(f)` | открывает для дозаписи (**только Text**) |

Если файла нет:

- `Rewrite` — создаст.
- `Reset` — ошибка «файл не найден».
- `Append` — создаст новый.

---

## 6. Проверка существования файла

Стандартный способ — `FileExists` (в PascalABC.NET и Free Pascal):

```pascal
if FileExists('data.txt') then
begin
  Assign(f, 'data.txt');
  Reset(f);
  ...
  Close(f);
end
else
  WriteLn('Файл не найден');
```

В классическом Pascal ABC можно использовать `FileExists` из модуля `Files`
или обработать ошибку через `{$I-}` / `IOResult`.

---

## 7. Чтение чисел из текстового файла

Если файл содержит числа через пробел/строки:

```pascal
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
```

`Read(f, n)` для `Text` читает число, пропуская пробелы и переводы строк.

---

## 8. Типичные задачи

### Копирование файла

```pascal
var
  fin, fout: Text;
  s: String;
begin
  Assign(fin, 'in.txt');   Reset(fin);
  Assign(fout, 'out.txt'); Rewrite(fout);

  while not Eof(fin) do
  begin
    ReadLn(fin, s);
    WriteLn(fout, s);
  end;

  Close(fin);
  Close(fout);
end.
```

### Подсчёт строк в файле

```pascal
var
  f: Text;
  s: String;
  count: Integer;
begin
  Assign(f, 'data.txt'); Reset(f);
  count := 0;
  while not Eof(f) do
  begin
    ReadLn(f, s);
    Inc(count);
  end;
  Close(f);
  WriteLn('Строк: ', count);
end.
```

### Сумма чисел из файла

```pascal
var
  f: Text;
  n, sum: Integer;
begin
  Assign(f, 'nums.txt'); Reset(f);
  sum := 0;
  while not Eof(f) do
  begin
    Read(f, n);
    sum := sum + n;
  end;
  Close(f);
  WriteLn('Сумма: ', sum);
end.
```

### Сохранение массива в файл

```pascal
var
  f: file of Integer;
  a: array[1..5] of Integer;
  i: Integer;
begin
  for i := 1 to 5 do a[i] := i * i;

  Assign(f, 'arr.dat'); Rewrite(f);
  for i := 1 to 5 do Write(f, a[i]);
  Close(f);

  Assign(f, 'arr.dat'); Reset(f);
  i := 1;
  while not Eof(f) do
  begin
    Read(f, a[i]);
    Write(a[i], ' ');
    Inc(i);
  end;
  Close(f);
  WriteLn;
end.
```

---

## 9. Частые ошибки

- **Забыли `Close(f)`** — данные могут не сохраниться.
- **`Reset` до `Assign`** — ошибка «файл не назначен».
- **`Reset` несуществующего файла** — ошибка времени выполнения.
- **Перепутали `Rewrite` и `Reset`** — `Rewrite` затирает файл.
- **`ReadLn(f, s)` в типизированном файле** — там только `Read` / `Write`.
- **`Append` для `file of T`** — нельзя, только для `Text`.

---

## Примеры

- [text_write.pas](text_write.pas) — запись строк в текстовый файл
- [text_read.pas](text_read.pas) — чтение строк из файла
- [text_append.pas](text_append.pas) — дозапись в конец
- [text_copy.pas](text_copy.pas) — копирование файла
- [count_lines.pas](count_lines.pas) — подсчёт строк
- [sum_numbers.pas](sum_numbers.pas) — сумма чисел из файла
- [typed_file.pas](typed_file.pas) — типизированный файл чисел
- [file_of_records.pas](file_of_records.pas) — файл записей

## Запуск

**Pascal ABC:** открыть файл, F9.

**Free Pascal:**

```bash
fpc text_write.pas
./text_write
```

> При запуске в Linux/macOS рабочая директория — та, из которой запущен
> бинарник. Файл `data.txt` появится там же.

## Что дальше

Урок 10 — итоговый проект.