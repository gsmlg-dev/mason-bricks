import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationSupportDirectory;

import 'schema.dart' show allSchema;

class Database {
  static late Database _singleton;

  static Future<void> initialize() async {
    final dir = await getApplicationSupportDirectory();
    final isar = await Isar.open(
      name: 'GSMLG.app',
      allSchema,
      directory: dir.path,
      inspector: !kReleaseMode,
    );
    _singleton = Database._(isar);
  }

  final Isar instance;

  factory Database() {
    return _singleton;
  }

  Database._(this.instance);
}