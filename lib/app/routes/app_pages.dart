import 'package:auto_route/auto_route.dart';
import 'package:loa_application_with_boilerplate/app/routes/app_routes.dart';
import 'package:loa_application_with_boilerplate/ui/screens/home/home_screen.dart';
import 'package:loa_application_with_boilerplate/ui/screens/initial/initial_screen.dart';

part 'app_pages.gr.dart';

@AutoRouterConfig()
class AppPages extends _$AppPages {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitialRoute.page, initial: true, path: AppRoutes.initial),
        AutoRoute(page: HomeRoute.page, path: AppRoutes.home),
      ];
}
