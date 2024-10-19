import 'package:flutter/material.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: appTheme.colorScheme.secondary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            appTheme.colorScheme.onError,
            appTheme.colorScheme.onPrimaryContainer,
            appTheme.colorScheme.onError,
          ],
          begin: const Alignment(0.02, -0.9),
          end: const Alignment(-0.21, 0.2),
          stops: const [0.32, 0.52, 0.6],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Image(
            image: AssetImage(
              'assets/images/home.png',
            ),
            width: 110,
            height: 110,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nice to meet you,',
                  style: TextStyle(
                    color: appTheme.colorScheme.onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Create your account\nand start your journey',
                  style: TextStyle(
                    color: appTheme.colorScheme.onSurface,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
