import 'dart:io';

import 'package:swiss_dart/automation/constants/automation_constants.dart';
import 'package:swiss_dart/automation/features/automation_features.dart';

class AutomationController{
  static automationActions(List<String> arguments){
    if(arguments[1].toLowerCase() == AutomationConstants.actions[0]){
      AutomationFeatures.automateCreationOfDir(arguments);
    } else {
      exitCode = 0;
    }
  }
}