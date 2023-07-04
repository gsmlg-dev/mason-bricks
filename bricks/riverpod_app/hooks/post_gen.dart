import 'package:mason/mason.dart';

void run(HookContext context) {
  final progress = context.logger.progress('Installing packages');

  final pkgs = [
    'go_router',
    'flutter_riverpod',
    'riverpod_annotation',
    'isar'
    'isar_flutter_libs',
    'path_provider',
  ];
  for (var p in pkgs) {
    await Process.run('flutter', ['pub', 'add', p]);
  }

  final devPkgs = [
    'build_runner',
    'go_router_builder',
    'riverpod_generator',
    'custom_lint',
    'riverpod_lint',
    'isar_generator',
  ];
  for (var p in devPkgs) {
    await Process.run('flutter', ['pub', 'add', 'dev:$p']);
  }

  progress.complete();
}
