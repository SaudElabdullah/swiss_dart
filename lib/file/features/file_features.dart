import 'dart:io';

class FileFeatures {
  static int files = 0;
  static int size = 0;

  static void scan(List<String> arguments) async {
    await traverse(arguments[2]);
    stdout.writeln("\n total files: $files ");
    stdout.writeln(" total size: $size bytes");
  }

  static Future<void> traverse(String path) async {
    stdout.writeln("\n  $path");

    try {
      Directory dir = Directory(path);
      Stream<FileSystemEntity> items = dir.list();

      await for (FileSystemEntity f in items) {
        (f is Directory) ? await traverse(f.path) : await stat(f);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> stat(FileSystemEntity f) async {
    int fileSize = (await f.stat()).size;
    size += fileSize;
    files += 1;

    String out = f.path.padLeft(f.path.length + 4);
    stdout.writeln("$out $fileSize bytes");
  }
}
