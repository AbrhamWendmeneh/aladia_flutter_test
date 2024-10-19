import 'package:aladia_flutter_test/features/authentication/login/social_media_buttons.dart';

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Social media', type: SocialMediaButtons)
Widget socialMediaUseCase(BuildContext context) {
  return const SocialMediaButtons();
}
