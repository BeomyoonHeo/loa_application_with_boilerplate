import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loa_application_with_boilerplate/app/environment/environment.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    final Environment env = Environment(BuildType.dev);

    env.run();
  }, (error, stack) {});
}
