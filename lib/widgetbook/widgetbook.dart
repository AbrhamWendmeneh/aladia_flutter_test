import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:aladia_flutter_test/widgets/custom_button.dart';
import 'package:aladia_flutter_test/widgets/input_field.dart';
import 'package:aladia_flutter_test/widgets/theme_toggle.dart';
import 'package:aladia_flutter_test/features/authentication/login/social_media_buttons.dart';

import 'widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}
@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Widgetbook.material(directories: directories);
  }
}
