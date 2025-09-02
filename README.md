# Recursive Caster

This package is a package designed to make it easier to recursively cast nested objects. For example, if you have a `List<dynamic>`, and you want it to be a `List<Map<String, dynamic>>`, you can't cast it normally; you would need to make a helper function to recursively cast the object. That's where this package comes into play.

I can't make a one-and-done solution, as that's just not possible with a standard package. This package isn't a standard package; it's a CLI tool.

Note that this package is in beta right now.

## Installation

- Add `recursive_caster` to `dev_dependencies` in your `pubspec.yaml`.
- Run `dart pub get` or `flutter pub get`.

## Setup

To start, you'll need to create a configuration file. Luckily, this can be done for you.

In the root of the project directory (or specify a relative/absolute directory using `--project-dir=`), run this command: `dart run recursive_caster:initialize` (or the flutter equivalent). Run with `--help` for available arguments.

This will create a configuration file named `recursive_caster.yaml`. If a configuration file already exists, then it will prompt you to overwrite it. This will *not* keep any of your settings.

Please read through `recursive_caster.yaml` for other settings that may be required.

## Generating

This package will use your configuration file to generate a library file. This will by default be generated in `lib`, but you can specify a custom subdirectory. The library file will be named 'recursive_caster.g.dart`. It's recommended to add this file to your gitignore, as it can be regenerated using your configuration file.

Any modifications to this generated file aren't saved. If you need customizations that this package doesn't provide, feel free to make an issue or pull request on GitHub.

## Usage

You'll need to import `recursive_caster.g.dart` into any files you use the recursive caster in. After that, you'll access all functions through the class `RecursiveCaster`. Every method is static.

`RecursiveCaster.getAll()` returns an `Iterable<Type>` of all the available types to be casted to.

`RecursiveCaster.cast()` returns the inputted `Object?`, but casted as the inputted `T`. Example:

```dart
List<String> myList = RecursiveCaster.cast<List<String>>(<dynamic>["Hello", "world!"]);
```

You can see more detailed examples in `example/example.dart`.
