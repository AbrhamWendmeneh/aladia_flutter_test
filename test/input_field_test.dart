import 'package:aladia_flutter_test/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InputField Widget Tests', () {
    testWidgets('InputField renders with given properties',
        (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: InputField(
              icon: Icons.person,
              hintText: 'Enter your name',
              labelText: 'Name',
              controller: controller,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.text('Enter your name'), findsOneWidget);
      expect(find.text('Name'), findsOneWidget);
    });

    testWidgets('InputField accepts input and updates controller',
        (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: InputField(
              hintText: 'Enter your name',
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'John Doe');
      await tester.pump();

      expect(controller.text, 'John Doe');
    });

    testWidgets('InputField shows error text when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: InputField(
              hintText: 'Enter your name',
              errorText: 'Name is required',
            ),
          ),
        ),
      );

      expect(find.text('Name is required'), findsOneWidget);
    });

    testWidgets('InputField calls onSuffixIconTap when suffix icon is tapped',
        (WidgetTester tester) async {
      bool suffixIconTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: InputField(
              suffixIcon: Icons.visibility,
              onSuffixIconTap: () {
                suffixIconTapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      expect(suffixIconTapped, isTrue);
    });
  });
}
