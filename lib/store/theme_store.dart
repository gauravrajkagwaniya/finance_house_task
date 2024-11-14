import 'package:finance_house_task/store/root_store.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final RootStore rootStore;
  _ThemeStore({required this.rootStore});

  @observable
  bool isDarkMode = false;

  @action
  void toggleTheme() {
    isDarkMode = !isDarkMode;
  }
}
