import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loa_application_with_boilerplate/app/config/size_config.dart';
import 'package:loa_application_with_boilerplate/app/di/app_buildings.dart';
import 'package:loa_application_with_boilerplate/app/routes/app_pages.dart';
import 'package:loa_application_with_boilerplate/app/routes/app_routes.dart';

const _appDesignSize = Size(360, 720);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: _appDesignSize,
      builder: (context, _) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'LostArkAppWithBoilerPlate',
        routerConfig: AppPages().config(),
        builder: (context, child) {
          SizeConfig().init(context);
          return FutureBuilder(
            builder: (context, snapshots) => EasyLoading.init()(
              context,
              AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.dark,
                child: child ?? const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }
}
