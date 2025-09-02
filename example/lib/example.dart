import 'dart:convert';

import 'recursive_caster.g.dart';
import 'package:http/http.dart' as http;

export 'recursive_caster.g.dart';

Future<void> main(List<String> arguments) async {
  simpleTest();
  await apiTest();
}

void simpleTest() {
  List untypedData = [
    Example<String>(),
    Example<String>(),
  ];

  print("Simple: Untyped data: ${untypedData.runtimeType}");

  print("Simple: Casted untyped data: ${() {
    try {
      return (untypedData as List<Example<String>>).runtimeType;
    } catch (e) {
      return "Exception: $e";
    }
  }()}");

  List<Example<String>> typedData = RecursiveCaster.cast(untypedData);
  print("Simple: Typed data: ${typedData.runtimeType}");
}

Future<void> apiTest() async {
  print("API: Fetching...");
  Uri uri = Uri.parse("https://api.sampleapis.com/baseball/hitsSingleSeason");
  http.Response response = await http.get(uri);
  var body = await jsonDecode(response.body);
  List untypedData = body;

  print("API: Body typed at runtime: ${body.runtimeType}");
  print("API: Untyped data: ${untypedData.runtimeType}");

  print("API: Casted untyped data: ${() {
    try {
      return (untypedData as List<Map<String, dynamic>>).runtimeType;
    } catch (e) {
      return "Exception: $e";
    }
  }()}");

  List<Map<String, dynamic>> typedData = RecursiveCaster.cast(untypedData);
  print("API: Typed data: ${typedData.runtimeType}");
}

class Example<T> {
  Example();
}