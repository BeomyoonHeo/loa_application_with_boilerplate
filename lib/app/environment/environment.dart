import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loa_application_with_boilerplate/main.dart';

enum BuildType { product, dev }

class Environment {
  static Environment? _instance;

  final BuildType _buildType;
  const Environment._internal(this._buildType);

  factory Environment(BuildType buildType) => _instance ??= Environment._internal(buildType);

  static get buildType => _instance!._buildType;

  static String get loaApiKey {
    assert(dotenv.env['LOA_API_KEY_PRODUCTION'] != null);
    assert(dotenv.env['LOA_API_KEY_DEVELOPMENT'] != null);

    return _instance!._buildType == BuildType.product
        ? dotenv.env['LOA_API_KEY_PRODUCTION']!
        : dotenv.env['LOA_API_KEY_DEVELOPMENT']!;
  }

  static String get baseUrl {
    assert(dotenv.env['BASE_URL_PRODUCTION'] != null);
    assert(dotenv.env['BASE_URL_DEVELOPMENT'] != null);

    return _instance!._buildType == BuildType.product
        ? dotenv.env['BASE_URL_PRODUCTION']!
        : dotenv.env['BASE_URL_DEVELOPMENT']!;
  }

  void run() {
    runApp(
      Phoenix(child: const ProviderScope(child: MyApp())),
    );
  }
}
