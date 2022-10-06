import 'dart:io';

import 'package:swiss_dart/json/controllers/json_controller.dart';
import 'package:swiss_dart/main/constants/main_constants.dart';

class MainController{
  static mainActions(List<String> arguments){
    if(arguments.first.toLowerCase() == MainConstants.actions[0]){
      JsonController.jsonActions(arguments);
    } else {
      exitCode = 0;
    }
  }
}