import 'package:flutter/material.dart';

import '../widget_tools/responsive.dart';
import 'config.dart';

extension Extension on BuildContext {

  void toNamed(String value, {dynamic arguments}) async {
    await Navigator.pushNamed(this, value, arguments: arguments);
  }

  void back({String? value}) {
    Navigator.pop(this, value);
  }
}
