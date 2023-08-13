import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loa_application_with_boilerplate/app/environment/environment.dart';
import 'package:loa_application_with_boilerplate/ui/common/base/base_view_model.dart';

final initialViewModelProvider = Provider<InitialViewModel>((ref) {
  return InitialViewModel(Environment.loaApiKey)..init();
});

class InitialViewModel extends BaseViewModel {
  InitialViewModel(this._apiKey);

  final String _apiKey;

  String get apiKey => _apiKey;

  @override
  Future<void> init() async {
    super.init();
  }
}
