import 'dart:io';

import 'package:swiss_dart/file/constants/file_constants.dart';
import 'package:swiss_dart/file/features/file_features.dart';

class FileController{
  static fileActions(List<String> arguments){
    if(arguments[1].toLowerCase() == FileConstants.actions[0]){
      FileFeatures.scan(arguments);
    } else {
      exitCode = 0;
    }
  }
}
