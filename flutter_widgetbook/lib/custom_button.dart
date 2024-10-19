import 'package:aladia_flutter_test/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Custom Button', type: CustomButton)
Widget customButtonUseCase(BuildContext context) {
  return CustomButton(
    child: Text(context.knobs.string(
      label: 'label',
      initialValue: 'Custom Button',
    )),
    onPressed: () {},
  );
}
