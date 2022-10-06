import 'dart:io';

import 'package:swiss_dart/json/constants/json_constants.dart';
import 'package:swiss_dart/json/features/json_features.dart';

class JsonController{
  static jsonActions(List<String> arguments){
    if(arguments[1].toLowerCase() == JsonConstants.actions[0]){
      JsonFeatures.jsonPretty(arguments[2]);
    } else {
      exitCode = 0;
    }
  }
}