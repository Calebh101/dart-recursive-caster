import 'recursive_caster.g.dart';
export 'recursive_caster.g.dart';

void main(List<String> arguments) {
  List untypedData = [
    Example<String>(),
    Example<String>(),
  ];

  print("Untyped data: ${untypedData.runtimeType}");
  List<Example<String>> typedData = RecursiveCaster.convert(untypedData);
  print("Typed data: ${typedData.runtimeType}");
}

class Example<T> {
  Example();
}