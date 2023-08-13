import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:loa_application_with_boilerplate/ui/common/base/base_screen.dart';

@RoutePage()
class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Home Screen',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
