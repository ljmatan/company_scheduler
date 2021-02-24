import 'package:company_scheduler/logic/local_storage/data/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {
  static SharedPreferences instance;

  static void getLocalData() {
    UserInfo.setUsername(instance.getString('username'));
    UserInfo.setPassword(instance.getString('password'));
    UserInfo.setID(instance.getString('id'));
  }

  static Future<void> setLocalData(
    String username,
    String password,
    String id,
  ) async {
    await instance.setString('username', username);
    await instance.setString('password', password);
    await instance.setString('id', id).whenComplete(() => getLocalData());
  }

  static Future<void> init() async =>
      instance = await SharedPreferences.getInstance();
}
