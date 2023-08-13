import 'package:loa_application_with_boilerplate/app/di/modules/data_modules.dart';
import 'package:loa_application_with_boilerplate/app/di/modules/domain_modules.dart';
import 'package:loa_application_with_boilerplate/app/di/modules/ui_modules.dart';

class AppBindings {
  Future<void> dependencies() async {
    DataModules.dependencies();
    DomainModules.dependencies();
    UiModules.dependencies();
  }
}
