import '../global.dart';

/**my sample**/
class UserService extends APIService {
  UserService();

  factory UserService.getInstance() => _instance;
  static final UserService _instance = UserService();

  Future<List<User>?> getUsers() async {
    final response = await (get("users"));
    if (response == null) {
      return null;
    }
    return List<User>.from(
        response['data'].map((model) => User.fromJson(model)));
  }
}
