import 'package:mockito/annotations.dart';

import '../theme_store_test.dart';

@GenerateNiceMocks([MockSpec<ThemeStore>(onMissingStub: OnMissingStub.returnDefault )])
class ThemeStore {

  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
  }
}
