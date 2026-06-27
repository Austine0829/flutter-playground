
import 'package:hive_ce/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  User({
    required this.name,
    required this.age
  });

  factory User.toObject(Map<dynamic, User> map) {
    return User(
      name: map.values.first.name, 
      age: map.values.first.age
    );
  }
}