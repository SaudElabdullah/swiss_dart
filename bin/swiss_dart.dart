import 'dart:io';
import 'package:swiss_dart/main/controllers/main_controller.dart';

void main(List<String> arguments) {
  exitCode = 0;
  MainController.mainActions(arguments);
}