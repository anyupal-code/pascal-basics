# Основы программирования на языке Pascal

Базовый практический курс языка Pascal: 10 уроков, от первой программы
до работы с файлами. Каждый урок — отдельная папка с краткими конспектами
и рабочими примерами кода.

Курс рассчитан на начинающих. Опыт программирования не требуется.

## Среда

Примеры проверены в **Pascal ABC** / **PascalABC.NET**.

- Скачать: <https://pascalabc.net>
- Открыть `.pas`-файл и нажать **F9** для запуска.

Альтернатива — **Free Pascal** (fpc 3.2+). Отдельные примеры могут
потребовать небольших правок (в частности, подключения модулей).

## Содержание

| № | Тема | Конспект | Примеры |
|---|------|----------|---------|
| 1 | Введение, структура программы | [README](lesson-01-intro/README.md) | [код](lesson-01-intro/) |
| 2 | Переменные, типы, ввод/вывод | [README](lesson-02-vars/README.md) | [код](lesson-02-vars/) |
| 3 | Ветвления: `if`, `case` | [README](lesson-03-conditions/README.md) | [код](lesson-03-conditions/) |
| 4 | Циклы: `for`, `while`, `repeat` | [README](lesson-04-loops/README.md) | [код](lesson-04-loops/) |
| 5 | Массивы | [README](lesson-05-arrays/README.md) | [код](lesson-05-arrays/) |
| 6 | Процедуры и функции | [README](lesson-06-subprograms/README.md) | [код](lesson-06-subprograms/) |
| 7 | Строки и символы | [README](lesson-07-strings/README.md) | [код](lesson-07-strings/) |
| 8 | Записи и множества | [README](lesson-08-records-sets/README.md) | [код](lesson-08-records-sets/) |
| 9 | Файлы | [README](lesson-09-files/README.md) | [код](lesson-09-files/) |
| 10 | Итоговый проект | [README](lesson-10-project/README.md) | [код](lesson-10-project/) |

## Структура репозитория

```
pascal-course/
├── README.md
├── lesson-01-intro/
│   ├── README.md
│   └── *.pas
├── lesson-02-vars/
│   ├── README.md
│   └── *.pas
...
```

В каждой папке урока:

- `README.md` — краткий конспект: цель, ключевые понятия, примеры, что дальше.
- `*.pas` — рабочие примеры кода с комментариями.

## Как проходить курс

1. Читаем `README.md` урока.
2. Открываем и разбираем примеры `*.pas`.
3. Запускаем, меняем, экспериментируем.
4. Переходим к следующему уроку.

## Требования

- Pascal ABC / PascalABC.NET (рекомендуется)
- либо Free Pascal 3.2+
