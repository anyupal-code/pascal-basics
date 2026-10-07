# Урок 6. Процедуры и функции

## Цель

Научиться разбивать программу на подпрограммы: выносить повторяющиеся
действия в процедуры и функции, передавать параметры и возвращать результат.

## Ключевые понятия

- **Подпрограмма** — именованный блок кода, вызываемый по имени.
- **Процедура** — подпрограмма, не возвращающая значение.
- **Функция** — подпрограмма, возвращающая значение.
- **Параметр** — переменная в заголовке подпрограммы.
- **Аргумент** — значение, передаваемое при вызове.
- **Локальная переменная** — объявлена внутри подпрограммы, видна только в ней.

---

## 1. Зачем нужны подпрограммы

- **Не дублировать код** — один раз описали, вызываем много раз.
- **Разбить задачу** на части — каждая решает одну подзадачу.
- **Упростить отладку** — ищем ошибку в конкретной подпрограмме.
- **Повторное использование** — подпрограмма переносится в другой проект.

---

## 2. Процедура

Не возвращает значение, просто выполняет действия.

```pascal
procedure PrintLine(n: Integer);
var
  i: Integer;
begin
  for i := 1 to n do Write('-');
  WriteLn;
end;
```

Вызов:

```pascal
PrintLine(20);
```

- Параметры в скобках, через `;`.
- Свои локальные переменные объявляются **внутри** процедуры (свой `var`).
- Завершается `end;` — точкой с запятой.

### Процедура без параметров

```pascal
procedure Hello;
begin
  WriteLn('Привет');
end;
...
Hello;
```

---

## 3. Функция

Возвращает значение. Результат присваивается **имени функции**.

```pascal
function Sum(a, b: Integer): Integer;
begin
  Sum := a + b;
end;
```

- После скобок идёт `: Тип` — тип возвращаемого значения.
- В теле хотя бы раз должно быть `Имя := значение`.
- Вызов — в выражении:

```pascal
s := Sum(3, 5);
WriteLn(Sum(10, 20) * 2);
```

### Функция с ветвлением

```pascal
function Max(a, b: Integer): Integer;
begin
  if a > b then Max := a
  else Max := b;
end;
```

### Ранний выход — `Exit(value)`

Pascal ABC и Free Pascal поддерживают `Exit` с параметром:

```pascal
function Div2(x: Integer): Integer;
begin
  if x mod 2 <> 0 then Exit(0);
  Div2 := x div 2;
end;
```

Без параметра `Exit` просто завершает подпрограмму.

---

## 4. Параметры

### По значению (по умолчанию)

Передаётся **копия**. Изменения внутри не влияют на оригинал.

```pascal
procedure BadInc(x: Integer);
begin
  x := x + 1;   { изменится только локальная копия }
end;
```

### По ссылке — `var`

Передаётся **сама переменная**. Изменения видны снаружи.

```pascal
procedure Inc2(var x: Integer);
begin
  x := x + 2;
end;

var a: Integer;
...
a := 5;
Inc2(a);      { a = 7 }
```

### Константные параметры — `const`

Обещание не менять параметр. Быстрее для больших структур (нет копирования).

```pascal
function Length2(const s: String): Integer;
begin
  Length2 := Length(s) * 2;
end;
```

### Итого

| Способ | Ключевое слово | Копия? | Можно менять? |
|---|---|---|---|
| По значению | — | да | да, но только копию |
| По ссылке | `var` | нет | да, влияет на оригинал |
| Константа | `const` | нет | нет (запрещено) |

---

## 5. Область видимости

- **Локальные** переменные — объявлены внутри подпрограммы. Видны только там.
- **Глобальные** — объявлены в основном `var`. Видны везде.
- Локальная переменная **затеняет** глобальную с тем же именем.
- Хороший стиль — минимум глобальных переменных, максимум локальных.

```pascal
var
  x: Integer;             { глобальная }

procedure P;
var
  x: Integer;             { локальная, затеняет глобальную }
begin
  x := 10;                { меняем локальную }
end;

begin
  x := 5;
  P;
  WriteLn(x);             { всё ещё 5 }
end.
```

---

## 6. Рекурсия

Подпрограмма вызывает саму себя.

```pascal
function Fact(n: Integer): Int64;
begin
  if n <= 1 then Fact := 1
  else Fact := n * Fact(n - 1);
end;
```

- Нужно **базовое условие** (`n <= 1`) — иначе бесконечная рекурсия.
- Каждый вызов — новый слой стека.
- При большой глубине — переполнение стека.

### Числа Фибоначчи рекурсией

```pascal
function Fib(n: Integer): Int64;
begin
  if n <= 1 then Fib := n
  else Fib := Fib(n - 1) + Fib(n - 2);
end;
```

> Это **медленно** для больших `n` (экспоненциальная сложность).
> Итеративный вариант — в Уроке 4.

### Быстрое возведение в степень

```pascal
function Pow(a, n: Integer): Int64;
begin
  if n = 0 then Pow := 1
  else if n mod 2 = 0 then
  begin
    var t := Pow(a, n div 2);
    Pow := t * t;
  end
  else Pow := a * Pow(a, n - 1);
end;
```

> `var t := ...` — сокращённое объявление, поддерживается в PascalABC.NET.
> В классическом Pascal ABC объявите `t` в разделе `var` функции.

---

## 7. Форвард-объявление

Если процедура A вызывает B, а B — A, нужен **forward**:

```pascal
procedure B(x: Integer); forward;

procedure A(x: Integer);
begin
  B(x);
end;

procedure B(x: Integer);
begin
  ...
end;
```

В базовом курсе нужен редко.

---

## 8. Частые ошибки

- **Забыли `Имя := значение`** в функции — вернётся мусор.
- **Путаница `var`-параметра и обычного** — изменения не видны снаружи.
- **Одинаковые имена локальной и глобальной** — затенение, легко ошибиться.
- **Нет базового условия в рекурсии** — переполнение стека.
- **Точка с запятой перед `else`** внутри подпрограммы — как обычно.

---

## 9. Типичные задачи

### Обмен двух переменных

```pascal
procedure Swap(var a, b: Integer);
var
  t: Integer;
begin
  t := a; a := b; b := t;
end;
```

### НОД (алгоритм Евклида)

```pascal
function GCD(a, b: Integer): Integer;
begin
  while b <> 0 do
  begin
    var t := b;
    b := a mod b;
    a := t;
  end;
  GCD := a;
end;
```

Рекурсивно:

```pascal
function GCD(a, b: Integer): Integer;
begin
  if b = 0 then GCD := a
  else GCD := GCD(b, a mod b);
end;
```

### Проверка простого числа

```pascal
function IsPrime(n: Integer): Boolean;
var
  i: Integer;
begin
  if n < 2 then Exit(False);
  i := 2;
  while i * i <= n do
  begin
    if n mod i = 0 then Exit(False);
    Inc(i);
  end;
  IsPrime := True;
end;
```

### Сумма элементов массива

```pascal
function SumArr(const a: array of Integer): Integer;
var
  i, s: Integer;
begin
  s := 0;
  for i := 0 to High(a) do
    s := s + a[i];
  SumArr := s;
end;
```

> `array of Integer` — **открытый массив**, принимает массивы любого размера.
> `High(a)` — верхняя граница индекса. `Low(a)` — нижняя.
> Поддерживается в Pascal ABC и Free Pascal.

---

## Примеры

- [procedure_demo.pas](procedure_demo.pas) — процедура с параметром и без
- [function_demo.pas](function_demo.pas) — функция, `Max`, `Sum`
- [var_params.pas](var_params.pas) — параметры по ссылке, `Swap`
- [scope.pas](scope.pas) — глобальные и локальные переменные
- [recursion.pas](recursion.pas) — факториал, Фибоначчи, быстрое возведение
- [gcd.pas](gcd.pas) — НОД циклом и рекурсией
- [is_prime.pas](is_prime.pas) — функция `IsPrime`
- [sum_array.pas](sum_array.pas) — открытый массив, `High`, `Low`

## Запуск

**Pascal ABC:** открыть файл, F9.

**Free Pascal:**

```bash
fpc procedure_demo.pas
./procedure_demo
```

## Что дальше

Урок 7 — строки и символы.