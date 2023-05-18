# flutter_river_flow

This is a sandbox for samples using riverpod eco system.

- Riverpod https://riverpod.dev/docs/getting_started/
- Freezed https://pub.dev/packages/freezed
- riverpod_generator https://pub.dev/packages/riverpod_generator
- riverpod_lint https://pub.dev/packages/riverpod_lint

# Contents

## Samples using Riverpod Generator

### Basic use of Riverpod Generator

there are four step when using riverpod generator.

1. import `riverpod_annotation` to the file
2. define `part: '<file_name>.g.dart'` to the file
3. define `@riverpod` class
4. generate file by `flutter pub run build_runner build`

### Provider those can be created

In riverpod generator, you can generate providers sucha s

- `Provider`
- `NotifierProvider`
- `AsyncNotifierProvider`
- `FutureProvider`
- `StreamProvider`

### 1. Provider

### 2. NotifierProvider

to create `NotifierProvider`, you need to define `@riverpod` class in below format.

```dart
@riverpod
class [YOUR CLASS NAME == FILE NAME] extends _$[YOUR CLASS NAME == FILE NAME] {
  // defined return type will be the state of the provider
  @override
  int build() => 0;
}
```

**State**

`NotifierProvider` can hold either normal value or `AsyncValue` as it's state.

Although, `AsyncNotifierProvider` will return a state in `AsyncValue` type by default. So if you want to return `AsyncValue` type, then you should use `AsyncNotifierProvider` instead.

**Class methods**

You can define sync or async methods in the class.

### 3. AsyncNotifierProvider

to create `AsyncNotifierProvider`, you need to define `@riverpod` class in below format.

```dart
@riverpod
class [YOUR CLASS NAME == FILE NAME] extends _$[YOUR CLASS NAME == FILE NAME] {
  // defined return type will be the state of the provider
  @override
  FutureOr<String> build() => 'hello';
}
```

**State**

State of `AsyncNotifierProvider` will be `AsyncValue` type by default. So if you want to return normal value, then you should use `NotifierProvider` instead.

**Class methods/**

You can define sync or async methods in the class.

### 4. FutureProvider

### 5. StreamProvider

### Wrapping up

You can consider each providers are used to provide the following class or methods.

`NotifierProvider`: StateNotifier with Synchrounous state.

`AsyncNotifierProvider`: StateNotifier with state being wrapped up in AsyncValue.

`Provider`: Method that returns synchronous value.

`FutureProvider`: Method that returns Future being provided through AsyncValue.

`StreamProvider`: Method that returns Stream being provided through AsyncValue.
