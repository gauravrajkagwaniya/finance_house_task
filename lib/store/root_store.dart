
import 'package:finance_house_task/store/connectivity_store.dart';
import 'package:finance_house_task/store/theme_store.dart';

import 'movie_store.dart';
import 'user_store.dart';

class RootStore {
  late MovieStore movieStore;
  late ThemeStore themeStore;
  late UserStore userStore;
  late ConnectivityStore connectivityStore;

  RootStore() {
    userStore = UserStore(rootStore: this);
    movieStore = MovieStore(rootStore: this);
    themeStore = ThemeStore(rootStore: this);
    connectivityStore = ConnectivityStore(rootStore: this);
  }
}