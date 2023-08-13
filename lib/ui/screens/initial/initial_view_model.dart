import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loa_application_with_boilerplate/app/environment/environment.dart';
import 'package:loa_application_with_boilerplate/app/routes/app_routes.dart';
import 'package:loa_application_with_boilerplate/ui/common/base/base_view_model.dart';
import 'package:logger/logger.dart';

final initialViewModelProvider = StateNotifierProvider<InitialViewModel, ViewModelStatus>((ref) {
  return InitialViewModel(Environment.loaApiKey)..init();
});

class InitialViewModel extends BaseViewModel {
  InitialViewModel(this._apiKey);

  final String _apiKey;

  String get apiKey => _apiKey;

  @override
  Future<void> init() async {
    super.init();
    assert(_apiKey.isNotEmpty);
    await Future.delayed(const Duration(seconds: 2));
    loaded();
  }

  void moveHome(BuildContext context) {
    AutoRouter.of(context).replaceNamed(AppRoutes.home);
  }
}
