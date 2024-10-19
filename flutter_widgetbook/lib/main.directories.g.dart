// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_widgetbook/custom_button.dart' as _i8;
import 'package:flutter_widgetbook/input_field.dart' as _i9;
import 'package:flutter_widgetbook/login_header.dart' as _i2;
import 'package:flutter_widgetbook/signup_form.dart' as _i4;
import 'package:flutter_widgetbook/signup_header.dart' as _i5;
import 'package:flutter_widgetbook/social_media.dart' as _i3;
import 'package:flutter_widgetbook/theme_toggle.dart' as _i10;
import 'package:flutter_widgetbook/verication_screen.dart' as _i7;
import 'package:flutter_widgetbook/verification_header.dart' as _i6;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'features',
    children: [
      _i1.WidgetbookFolder(
        name: 'authentication',
        children: [
          _i1.WidgetbookFolder(
            name: 'login',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'LoginHeader',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Login header',
                  builder: _i2.loginHeaderUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'SocialMediaButtons',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Social media',
                  builder: _i3.socialMediaUseCase,
                ),
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'signup',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'SignupForm',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Signup header',
                  builder: _i4.loginHeaderUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'SignupHeader',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Signup header',
                  builder: _i5.signupHeaderUseCase,
                ),
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'verification',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'VerificationHeader',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Signup header',
                  builder: _i6.verificationHeader,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'VerifyScreen',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Signup header',
                  builder: _i7.verficationScreen,
                ),
              ),
            ],
          ),
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'CustomButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Custom Button',
          builder: _i8.customButtonUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'InputField',
        useCase: _i1.WidgetbookUseCase(
          name: 'input field',
          builder: _i9.inputFieldUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ThemeToggleSwitch',
        useCase: _i1.WidgetbookUseCase(
          name: 'input field',
          builder: _i10.toggleUseCase,
        ),
      ),
    ],
  ),
];
