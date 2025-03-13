import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../dg-components/tools/dg-tools.dart';

class SplashProvider with ChangeNotifier {
  bool _isError = false;
  bool get isError => _isError;

  bool isButtonLoading = false;

  void start({required BuildContext context}) {
    DGTools.fullScreen(isEnabled: true);
    Future.delayed(const Duration(seconds: 3), () {
      DGTools.fullScreen(isEnabled: false);
      context.router.pushNamed('/page');
    });
  }
}
