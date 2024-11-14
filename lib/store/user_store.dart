import 'package:mobx/mobx.dart';
import '../global.dart';
import 'root_store.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final RootStore rootStore;

  _UserStore({required this.rootStore});

  @observable
  List<User> userList = [];
  @observable
  bool isDark = false;

  @action
  Future<void> addUser(User user) async {
    PreferencesService().setAuthToken('user');
    userList = [...userList, user];
  }



  @action
  Future<void> getUsers(User user) async {
    List<User>? userList = await UserService().getUsers();
    userList = userList ?? [];
  }

}
