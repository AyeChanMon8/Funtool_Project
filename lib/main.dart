import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'dg-components/dg-components.dart';
import 'injection_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); //DGHub
  await di.init();
  DGComponentsInstall.get(setupLogging: false);
  runApp(DGComponents());
}
