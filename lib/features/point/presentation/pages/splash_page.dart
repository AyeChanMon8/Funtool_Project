import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../routes/app_pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var box = GetStorage();
  static const alignment = [
    AlignmentDirectional.bottomCenter,
    AlignmentDirectional.center,
  ];
  int index = 0;
  double width = 100;
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        index = 1;
        width = 200;
      });
    });
    Future.delayed(
        Duration.zero,
        () => Get.dialog(
            Center(
                child: SpinKitCircle(
              color: Color.fromRGBO(63, 51, 128, 1),
              size: 30.0,
            )),
            barrierDismissible: false));
    Future.delayed(Duration(seconds: 4), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt('id') ?? 0;
      if (id != 0) {
        Get.offAllNamed(Routes.HOME, arguments: {
              "id": id
            });
      } else {
        Get.offAllNamed(Routes.LOGIN, arguments: false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: MediaQuery.of(context).size.width - 50,
          height: 120,
        ),
      ),
    );
  }
}
