import 'dart:io';

import 'package:swiss_dart/automation/constants/automation_constants.dart';
import 'package:swiss_dart/core/extensions/string_extension.dart';

class AutomationFeatures {
  static Future<void> createDirectory(String dir) async {
    await Directory(dir).create(recursive: true);
  }

  static void createFile(String path, String content) async {
    File(path).writeAsStringSync(content);
  }

  static Future<void> automateCreationOfDir(List<String> arguments) async {
    String dir = arguments[2];
    await createDirectory(dir);
    String? subDir = arguments[3];
    await createDirectory('$dir/$subDir');
    for (var element in AutomationConstants.fileNames) {
      if (element == 'view' || element == 'component') {
        await createDirectory('$dir/$subDir/${element}s');
        createFile(
          '$dir/$subDir/${element}s/${subDir}_$element.dart',
          AutomationConstants.fileContentsStateless.replaceAll(
            'YYNME',
            '$subDir${element.capitalizeFirstLetter()}',
          ),
        );
      } else {
        await createDirectory('$dir/$subDir/${element}s');
        createFile(
          '$dir/$subDir/${element}s/${subDir}_$element.dart',
          AutomationConstants.fileContents.replaceAll(
            'YYNME',
            '$subDir${element.capitalizeFirstLetter()}',
          ),
        );
      }
    }
  }
}
