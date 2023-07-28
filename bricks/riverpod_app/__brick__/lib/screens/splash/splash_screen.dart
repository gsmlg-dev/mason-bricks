import 'package:flutter/material.dart';
import 'package:{{appName.snakeCase()}}/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const path = '/splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(Constants.appName),
      ),
    );
  }
}
