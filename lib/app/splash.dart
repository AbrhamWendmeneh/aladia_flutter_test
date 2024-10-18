import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Image.asset('asset/images/logo.png'),
      ),
    );
  }
}
