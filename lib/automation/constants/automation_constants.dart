class AutomationConstants {
  static List<String> actions = const ['-c'];

  static String fileContentsStateless =
      "import 'package:flutter/material.dart'; class YYNME extends StatelessWidget {const YYNME({Key key}) : super(key: key);@overrideWidget build(BuildContext context) {return Container();}}";

  static String fileContents = 'class YYNME{}';

  static List<String> fileNames = ['view','component' ,'controller','model','service'];
}
