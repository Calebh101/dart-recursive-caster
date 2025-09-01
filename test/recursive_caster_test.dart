import 'package:recursive_caster/recursive_caster.g.dart';
import 'package:test/test.dart';

// We replace underscores at the end because Dart likes to sometimes use things like `_Map` instead of `Map`.

void main() {
  group("Test conversions from raw objects", () {
    test("Map<String, List<Map<String, dynamic>>>", () {
      Map item = {
        "users": [
          {"id": 1, "name": "Alice"},
          {"id": 2, "name": "Bob"}
        ],
        "admins": [
          {"id": 101, "name": "Charlie"}
        ]
      };

      Map<String, List<Map<String, dynamic>>> converted = RecursiveCaster.convert<Map<String, List<Map<String, dynamic>>>>(item);
      expect(converted.runtimeType.toString().replaceAll("_", ""), equals("Map<String, List<Map<String, dynamic>>>".replaceAll("_", "")));
    });

    test("Map<int, Set<List<String>>>", () {
      Map item = {
        1: {
          ["apple", "banana"],
          ["carrot"]
        },
        2: {
          ["dog", "elephant"]
        }
      };

      Map<int, Set<List<String>>> converted = RecursiveCaster.convert<Map<int, Set<List<String>>>>(item);
      expect(converted.runtimeType.toString().replaceAll("_", ""), equals("Map<int, Set<List<String>>>".replaceAll("_", "")));
    });

    test("Map<String, Map<int, bool>>", () {
      Map item = {
        "featureFlags": {
          1: true,
          2: false
        },
        "permissions": {
          10: true,
          20: false
        }
      };

      Map<String, Map<int, bool>> converted = RecursiveCaster.convert<Map<String, Map<int, bool>>>(item);
      expect(converted.runtimeType.toString().replaceAll("_", ""), equals("Map<String, Map<int, bool>>".replaceAll("_", "")));
    });
  });
}