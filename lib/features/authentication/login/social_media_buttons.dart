import 'package:aladia_flutter_test/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  final List<Map<String, String>> socialMediaData = const [
    {"image": "asset/images/google.png", "signIn": "Sign in with Google"},
    {"image": "asset/images/facebook.png", "signIn": "Sign in with Facebook"},
    {"image": "asset/images/apple.png", "signIn": "Sign in with Apple"}
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return Column(
      children: socialMediaData.map(
        (data) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomButton(
              color: appTheme.colorScheme.onPrimary,
              borderColor: appTheme.colorScheme.secondary,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    data["image"]!,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    data["signIn"]!,
                    style: TextStyle(
                      color: appTheme.colorScheme.onSurface,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
