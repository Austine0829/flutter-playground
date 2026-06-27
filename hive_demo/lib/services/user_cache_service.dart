import 'package:hive_ce/hive_ce.dart';
import 'package:hive_demo/user.dart';

class UserCacheService {
  Box<User> get _userBox => Hive.box("users");

  Future<void> addUser(int id, User user) async {
    await _userBox.put(id, user);
  } 

  List<User> getUsers() {
    return _userBox.values.toList();
  }

  Future<void> deleteUser(int id) async {
    await _userBox.delete(id);
  }

  Future<void> clearUsers() async {
    await _userBox.clear();
  }
}