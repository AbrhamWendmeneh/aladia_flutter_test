import 'dart:async';

import 'package:aladia_flutter_test/app/themes.dart';
import 'package:aladia_flutter_test/features/authentication/login/login_form.dart';
import 'package:aladia_flutter_test/features/authentication/login/login_header.dart';
import 'package:aladia_flutter_test/features/authentication/login/social_media_buttons.dart';
import 'package:aladia_flutter_test/features/authentication/signup/signup_screen.dart';
import 'package:aladia_flutter_test/features/authentication/verification/verify_screen.dart';
import 'package:aladia_flutter_test/providers/auth_provider.dart';
import 'package:aladia_flutter_test/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:aladia_flutter_test/data/services/auth_services.dart';
import 'package:aladia_flutter_test/app/app.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Import hive_flutter

import 'main.directories.g.dart';
import 'widgetbook_use_cases.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    await Hive.openBox('settings');
    runApp(const WidgetbookApp());
  }, (error, stackTrace) {
    debugPrint('Error: $error');
    debugPrint('StackTrace: $stackTrace');
  });
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(authInteractor: AuthServices()),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.themeMode,
            home: Widgetbook.material(
              directories: [
                WidgetbookComponent(
                  name: 'login',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'login header',
                      builder: (context) {
                        return const LoginHeader();
                      },
                    ),
                    WidgetbookUseCase(
                      name: 'login form',
                      builder: (context) {
                        return loginFormUseCase(context);
                      },
                    ),
                    WidgetbookUseCase(
                      name: 'Social media buttons',
                      builder: (context) {
                        return const SocialMediaButtons();
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'AuthPage',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Auth page',
                      builder: (context) {
                        return const AuthPage();
                      },
                    ),
                  ],
                ),
                // sign up page
                WidgetbookComponent(
                  name: 'sign up page',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'sign up page',
                      builder: (context) {
                        return const SignupScreen();
                      },
                    ),
                  ],
                ),
                // verification page
                WidgetbookComponent(
                  name: 'verification page',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'verification page',
                      builder: (context) {
                        return const VerifyScreen(email: 'test@example.com');
                      },
                    ),
                  ],
                ),
                // theme toggle switch
                WidgetbookComponent(
                  name: 'Theme Toggle Switch',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Toggle Switch',
                      builder: (context) {
                        return themeToggleSwitchUseCase(context);
                      },
                    ),
                  ],
                ),
              ],
              addons: [
                DeviceFrameAddon(
                  devices: [
                    Devices.android.samsungGalaxyS20,
                    Devices.ios.iPhone13,
                  ],
                  initialDevice: Devices.android.samsungGalaxyS20,
                ),
                MaterialThemeAddon(
                  themes: [
                    WidgetbookTheme(name: 'light', data: lightTheme),
                    WidgetbookTheme(name: 'dark', data: darkTheme),
                  ],
                  initialTheme: WidgetbookTheme(
                    name: 'light',
                    data: lightTheme,
                  ),
                ),
              ],
              integrations: [WidgetbookCloudIntegration()],
            ),
          );
        },
      ),
    );
  }
}
