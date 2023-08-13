import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loa_application_with_boilerplate/app/routes/app_routes.dart';
import 'package:loa_application_with_boilerplate/ui/common/base/base_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loa_application_with_boilerplate/ui/common/base/base_view_model.dart';
import 'package:loa_application_with_boilerplate/ui/screens/initial/initial_view_model.dart';
import 'package:logger/logger.dart';

@RoutePage()
class InitialScreen extends BaseScreen {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    final state = ref.watch(initialViewModelProvider);
    if (state == ViewModelStatus.loaded) {
      ref.read(initialViewModelProvider.notifier).moveHome(context);
    }
    return Center(
      child: SvgPicture.asset(
        'assets/loa_splash_screen.svg',
        width: 200,
        height: 200,
        allowDrawingOutsideViewBox: true,
        fit: BoxFit.cover,
      ),
    );
  }
}
