import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseScreen extends HookConsumerWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return wrapWithSafeArea
        ? SafeArea(
            top: setTopSafeArea,
            bottom: setBottomSafeArea,
            child: _buildScaffold(context, ref),
          )
        : _buildScaffold(context, ref);
  }

  Widget _buildScaffold(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: setBackgroundColor,
      appBar: buildAppBar(context),
      body: buildBody(context, ref),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  Widget? buildBottomNavigationBar(BuildContext context) => null;

  @protected
  @mustCallSuper
  Widget buildBody(BuildContext context, WidgetRef ref);

  @protected
  Color get setBackgroundColor => Colors.white;

  @protected
  bool get wrapWithSafeArea => true;

  @protected
  bool get setTopSafeArea => true;

  @protected
  bool get setBottomSafeArea => true;
}
