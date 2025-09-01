import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart' as p;

void main(List<String> arguments) {
  Directory root = Directory.current;
  print("Starting recursive_caster...");

  ArgParser parser = ArgParser()
    ..addOption("project-root", help: "Root of your project. This defaults to the current working directory.");

  ArgResults args = (() {
    try {
      ArgResults parsed = parser.parse(arguments);
      return parsed;
    } on FormatException catch (e) {
      print("${e.message}\n\nUsage:\n${parser.usage}");
      exit(1);
    }
  })();

  try {
    String given = args["project-root"]!;
    Directory newDir = Directory(given);
    if (newDir.existsSync()) root = newDir;
  } catch (e) {
    //
  }

  File settingsFile = File(p.joinAll([root.path, "recursive_caster.yaml"]));
  print("Writing to settings file $settingsFile...");

  if (settingsFile.existsSync()) {
    print("");
    print("Do you want to overwrite ${settingsFile.path}? This cannot be undone.");
    stdout.write("(Y/n) > ");

    String input = String.fromCharCode(stdin.readByteSync()).toLowerCase();
    bool yes = input == "y";
    if (!yes) exit(0);
  }

  String output = """
# This is the configuration file for recursive_caster.
# To reinitialize: dart run recursive_caster:initialize
# To generate: dart run recursive_caster


types:

# This is how you add types that you can convert to. This is a list of strings, where each item is the target type. Imports don't matter at this stage.
#
# Example:
#
# types:
#   - Map<String, List<Map<String, dynamic>>>
#   - List<Set<Map<String, List<Map<String, dynamic>>>>>
#   - List<Map<String, num>>


imports:

# This is how you import packages for custom and non-standard types into the generated file. The syntax is:
#   - package:example/example.dart [as prefix] [show Class1,Class2]
# prefix and show are not required. If you supply a prefix, you will have to make sure to use the prefix in your `types` definition.
#
# Example:
#
# imports:
#   - dart:io show File
#   - package:flutter/material.dart as material
""".trim();

  print("Writing out...");
  settingsFile.writeAsString(output);
}