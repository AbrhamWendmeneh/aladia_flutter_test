import 'package:aladia_flutter_test/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'input field', type: InputField)
Widget inputFieldUseCase(BuildContext context) {
  return InputField(
    hintText: context.knobs.string(
      label: 'hintText',
      initialValue: 'Input Field',
    ),
    labelText: context.knobs.string(
      label: 'labelText',
      initialValue: 'Input Field',
    ),
  );
}
