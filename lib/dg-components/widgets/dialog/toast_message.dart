import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';

showToastMessage({required BuildContext context, required String msg}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM, // Position: TOP, CENTER, BOTTOM
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
