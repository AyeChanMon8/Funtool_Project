import 'package:flutter/material.dart';

class AppRestart extends StatefulWidget {
  final Widget child;

  AppRestart({Key? key, required this.child}) : super(key: key);

  @override
  _AppRestartState createState() => _AppRestartState();

  static restart(BuildContext context) {
    context.findAncestorStateOfType<_AppRestartState>()!.restartApp();
  }
}

class _AppRestartState extends State<AppRestart> {
  Key _key = UniqueKey();

  void restartApp() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: widget.child,
    );
  }
}
