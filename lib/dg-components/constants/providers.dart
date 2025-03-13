import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../features/point/presentation/providers/dg-providers/splash/splash_provider.dart';
import '../../features/point/presentation/providers/user_provider.dart';
import '../../injection_container.dart' as di;

class Providers {
  static List<SingleChildWidget> get() => [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(
            create: (_) => UserProvider(
                  getUserDataUseCase: di.sl(),
                  getVerifyOtpDataUseCase: di.sl()
                )),
      ];
}
