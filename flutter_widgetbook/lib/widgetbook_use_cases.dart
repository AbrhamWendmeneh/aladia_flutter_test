import 'package:aladia_flutter_test/app/app.dart';
import 'package:aladia_flutter_test/features/authentication/signup/signup_form.dart';
import 'package:aladia_flutter_test/providers/theme_provider.dart';
import 'package:aladia_flutter_test/widgets/custom_button.dart';
import 'package:aladia_flutter_test/widgets/input_field.dart';
import 'package:aladia_flutter_test/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:aladia_flutter_test/features/authentication/login/login_form.dart';
import 'package:aladia_flutter_test/features/authentication/login/social_media_buttons.dart';
import 'package:aladia_flutter_test/features/authentication/verification/verify_screen.dart';

@widgetbook.UseCase(name: 'Login Form', type: LoginForm)
Widget loginFormUseCase(BuildContext context) {
  return LoginForm(
    emailController: TextEditingController(
      text: context.knobs
          .string(label: 'Email', initialValue: 'test@example.com'),
    ),
    passwordController: TextEditingController(
      text:
          context.knobs.string(label: 'Password', initialValue: 'password123'),
    ),
    isEnteringPassword:
        context.knobs.boolean(label: 'Entering Password', initialValue: true),
    formKey: GlobalKey<FormState>(),
  );
}

@widgetbook.UseCase(name: 'Social Media Buttons', type: SocialMediaButtons)
Widget socialMediaButtonsUseCase(BuildContext context) {
  return const SocialMediaButtons();
}

@widgetbook.UseCase(name: 'Auth Page', type: AuthPage)
Widget authPageUseCase(BuildContext context) {
  return const AuthPage();
}

@widgetbook.UseCase(name: 'Verify Screen', type: VerifyScreen)
Widget verifyScreenUseCase(BuildContext context) {
  return const VerifyScreen(email: 'test@example.com');
}

@widgetbook.UseCase(name: 'input field', type: ThemeToggleSwitch)
Widget themeToggleSwitchUseCase(BuildContext context) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
    ],
    child: const ThemeToggleSwitch(),
  );
}

@widgetbook.UseCase(name: 'signup form', type: SignupForm)
Widget signupFormUseCase(BuildContext context) {
  return SignupForm(
    emailController: TextEditingController(
      text: context.knobs
          .string(label: 'Email', initialValue: 'test@example.com'),
    ),
    passwordController: TextEditingController(
      text:
          context.knobs.string(label: 'Password', initialValue: 'password123'),
    ),
    confirmPasswordController: TextEditingController(
      text: context.knobs
          .string(label: 'Confirm Password', initialValue: 'password123'),
    ),
    nameController: TextEditingController(
        text: context.knobs.string(label: 'Name', initialValue: 'Abrish')),
    surnameController: TextEditingController(
        text: context.knobs.string(label: 'Surname', initialValue: 'Wend')),
    formKey: GlobalKey<FormState>(),
  );
}

@widgetbook.UseCase(name: 'custombutton', type: CustomButton)
Widget customButtonUseCase(BuildContext context) {
  return CustomButton(
    onPressed: () {},
    color: context.knobs.color(label: 'Color', initialValue: Colors.blue),
    borderColor:
        context.knobs.color(label: 'Border Color', initialValue: Colors.blue),
    padding: EdgeInsets.all(
        context.knobs.double.slider(label: 'Padding', initialValue: 8)),
    elevation: context.knobs.double.slider(label: 'Elevation', initialValue: 0),
    width: context.knobs.double.slider(label: 'Width', initialValue: 200),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
          context.knobs.double.slider(label: 'Border Radius', initialValue: 8)),
    ),
    boarderRadius: BorderRadius.circular(
        context.knobs.double.slider(label: 'Border Radius', initialValue: 8)),
    borderSide: BorderSide(
      color:
          context.knobs.color(label: 'Border Color', initialValue: Colors.blue),
    ),
    child: Text(context.knobs.string(label: 'Text', initialValue: 'Button')),
  );
}

@widgetbook.UseCase(name: 'custombutton', type: InputField)
Widget inputFieldUseCase(BuildContext context) {
  return InputField(
    controller: TextEditingController(
      text: context.knobs.string(label: 'Text', initialValue: 'Input Field'),
    ),
    obscureText:
        context.knobs.boolean(label: 'Obscure Text', initialValue: false),
    hintText: context.knobs.string(label: 'Hint Text', initialValue: 'Hint'),
    helperText: context.knobs.string(label: 'Helper Text', initialValue: ''),
    errorText: context.knobs.string(label: 'Error Text', initialValue: ''),
    labelText: context.knobs.string(label: 'Label Text', initialValue: 'Label'),
    suffixIcon: context.knobs.boolean(label: 'Suffix Icon', initialValue: false)
        ? Icons.visibility
        : null,
    onSuffixIconTap: () {},
    icon: context.knobs.boolean(label: 'Icon', initialValue: false)
        ? Icons.person
        : null,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    errorStyle: const TextStyle(color: Colors.red),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
          context.knobs.double.slider(label: 'Border Radius', initialValue: 8)),
    ),
  );
}
