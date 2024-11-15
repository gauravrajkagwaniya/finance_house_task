import 'package:finance_house_task/store/theme_store.dart';
import 'movie_store.dart';

class RootStore {
  late MovieStore movieStore;
  late ThemeStore themeStore;

  RootStore() {
    movieStore = MovieStore(rootStore: this);
    themeStore = ThemeStore(rootStore: this);
  }
}