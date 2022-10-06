import 'dart:convert';
import 'dart:io';

class JsonFeatures{
  static Future<String> getFile(String path) async {
    if (path.isEmpty) {
      return await stdin.pipe(stdout);
    } else {
      return await File(path).readAsString();
    }
  }

  static Future<void> jsonPretty(String path,) async {
    final String jsonFile = await getFile(path);
    try {
      const JsonDecoder decoder = JsonDecoder();
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final dynamic object = decoder.convert(jsonFile);
      final dynamic prettyString = encoder.convert(object);
      prettyString.split('\n').forEach((dynamic element) => stdout.writeln(element));
    } catch (_) {
      await _handleError(path);
    }
  }

  static Future<void> _handleError(String path) async {
    if (await FileSystemEntity.isDirectory(path)) {
      stderr.writeln('error: $path is a directory');
    } else {
      exitCode = 2;
    }
  }
}