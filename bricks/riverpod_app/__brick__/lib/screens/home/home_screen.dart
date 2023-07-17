import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const path = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('Demo')
        )  
      )
    );
  }
}
