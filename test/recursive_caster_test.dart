import '../example/lib/example.dart';
import 'package:test/test.dart';

// We replace underscores at the end because Dart likes to sometimes use things like `_Map` instead of `Map`.

void main() {
  group("Test conversions from raw objects", () {
    test("List<Set<Map<String, List<Map<String, dynamic>>>>>", () {
      List item = [
        {
          {
            "users": [
              {"id": 1, "name": "Alice"},
              {"id": 2, "name": "Bob"},
            ],
            "settings": [
              {"theme": "dark"},
              {"notifications": true},
            ]
          },
          {
            "products": [
              {"id": 101, "title": "Laptop"},
              {"id": 102, "title": "Phone"},
            ]
          }
        },
        {
          {
            "orders": [
              {"orderId": 5001, "amount": 250.75},
              {"orderId": 5002, "amount": 120.00},
            ]
          }
        }
      ];

      List<Set<Map<String, List<Map<String, dynamic>>>>> converted = RecursiveCaster.cast(item);
      expect(converted.runtimeType.toString().replaceAll("_", ""), equals("List<Set<Map<String, List<Map<String, dynamic>>>>>".replaceAll("_", "")));
    });

    test("List<Set<Map<String, List<Map<String, dynamic>>>>>", () {
      List item = [
        Example<String>(),
        Example<String>(),
      ];

      List<Example<String>> converted = RecursiveCaster.cast(item);
      expect(converted.runtimeType.toString().replaceAll("_", ""), equals("List<Example<String>>".replaceAll("_", "")));
    });
  });
}