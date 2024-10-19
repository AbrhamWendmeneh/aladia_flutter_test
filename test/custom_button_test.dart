import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aladia_flutter_test/widgets/custom_button.dart';

void main() {
  testWidgets('CustomButton renders correctly and responds to tap',
      (WidgetTester tester) async {
    bool wasPressed = false;

    debugPrint('Starting CustomButton test');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            onPressed: () {
              wasPressed = true;

              debugPrint('Button was pressed');
            },
            color: Colors.blue,
            width: 200,
            padding: const EdgeInsets.all(16.0),
            boarderRadius: BorderRadius.circular(12.0),
            borderColor: Colors.red,
            child: const Text('Press me'),
          ),
        ),
      ),
    );

    debugPrint('Widget pumped');

    expect(find.text('Press me'), findsOneWidget);
    expect(find.byType(CustomButton), findsOneWidget);

    final button = tester.widget<CustomButton>(find.byType(CustomButton));
    expect(button.color, Colors.blue);
    expect(button.width, 200);
    expect(button.padding, const EdgeInsets.all(16.0));
    expect(button.boarderRadius, BorderRadius.circular(12.0));
    expect(button.borderColor, Colors.red);

    await tester.tap(find.byType(CustomButton));
    await tester.pump();

    debugPrint('Button tapped');

    expect(wasPressed, isTrue);

    debugPrint('CustomButton test completed');
  });
}
