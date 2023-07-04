import 'package:mason/mason.dart';

void run(HookContext context) {
  // Read vars.
  final appName = context.vars['appName'];

  // Use the `Logger` instance.
  context.logger.info('generate $appName!');

  // Update vars.
  context.vars['current_year'] = DateTime.now().year;

}
