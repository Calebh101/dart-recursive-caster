import 'package:recursive_caster/recursive_caster.g.dart';
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

      List<Set<Map<String, List<Map<String, dynamic>>>>> converted = RecursiveCaster.convert<List<Set<Map<String, List<Map<String, dynamic>>>>>>(item);
      expect(converted.runtimeType.toString().replaceAll("_", ""), equals("List<Set<Map<String, List<Map<String, dynamic>>>>>".replaceAll("_", "")));
    });
  });
}