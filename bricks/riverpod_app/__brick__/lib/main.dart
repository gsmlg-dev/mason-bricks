import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{appName.snakeCase()}}/utils/state_logger.dart';
import 'package:{{appName.snakeCase()}}/app.dart';
import 'package:{{appName.snakeCase()}}/database/database.dart';

void main() async {
  await Database.initialize();

  runApp(
    const ProviderScope(observers: [StateLogger()], child: App()),
  );
}
