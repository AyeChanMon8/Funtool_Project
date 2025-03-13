import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'dg-providers/language_provider.dart';
import 'dg-providers/scroll_to_hide_provider.dart';

class DGProviders {
  static List<SingleChildWidget> get() => [
        ChangeNotifierProvider(create: (_) => ScrollToHideProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider())
      ];
}
