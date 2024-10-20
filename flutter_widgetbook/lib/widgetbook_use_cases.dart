import 'package:aladia_flutter_test/app/app.dart';
import 'package:aladia_flutter_test/providers/theme_provider.dart';
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
