import 'package:auto_route/auto_route.dart';
import 'package:loa_application_with_boilerplate/ui/screens/initial_screen.dart';

part 'app_pages.gr.dart';

@AutoRouterConfig()
class AppPages extends _$AppPages {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitialRoute.page, initial: true),
      ];
}
