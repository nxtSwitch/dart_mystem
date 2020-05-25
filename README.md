# Dart MyStem

Wraps Yandex MyStem 3.1 in dart, and additionally provides a dart friendly API.

## Requirements

You have to install [MyStem](https://yandex.ru/dev/mystem/) on your machine.

## Usage

```dart
  final mystem = MyStem();
  final data = await mystem.analyze('В мурелки шлепают пельсиски.');

  print(data);
  mystem.close();
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/nxtSwitch/dart_mystem/issues).
