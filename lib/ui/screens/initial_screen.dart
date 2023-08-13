import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loa_application_with_boilerplate/ui/common/base/base_screen.dart';
import 'package:loa_application_with_boilerplate/ui/screens/initial_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class InitialScreen extends BaseScreen {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    final initialViewModel = ref.watch(initialViewModelProvider);
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/loa_splash_screen.svg',
            width: 200,
            height: 200,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
