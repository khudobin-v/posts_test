# Posts Test Task (Flutter + Dio + Riverpod)

Тестовое задание на позицию Flutter стажера.

## Описание

Экран приложения получает список постов из API  
`https://jsonplaceholder.typicode.com/posts`  
через `Dio`, управляет состоянием через `Riverpod` и отображает данные в `ListView`.

## Требования из ТЗ

- Базовые знания Flutter и Dart
- Верстка интерфейса по макету
- Работа с HTTP-запросами (`Dio`)
- Управление состоянием (`Riverpod`)

## Что реализовано

- Получение постов с API `/posts`
- Получение автора поста с API `/users/{id}`
- Состояния загрузки / ошибка / данные
- Отображение списка постов в `ListView`
- Pull-to-refresh на экране постов

## Стек

- Flutter
- Dart
- Dio
- flutter_riverpod

## Структура проекта (основное)

- `lib/providers.dart` - Riverpod providers для данных
- `lib/home_page.dart` - экран списка постов
- `lib/widgets/post_card.dart` - карточка поста
- `lib/widgets/user_card.dart` - блок с автором

## Запуск

1. Установить зависимости:

```bash
flutter pub get
```

2. Запустить приложение:

```bash
flutter run
```
