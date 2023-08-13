import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    await dotenv.load();
  }, (error, stack) {});
}
