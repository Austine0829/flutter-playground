// class User {
//   final int? id;
//   final String email;
//   final String password;

//   User({this.id, required this.email, required this.password});

//   Map<String, dynamic> fromObjectToMap() {
//     return {
//       'id': id,
//       'email': email,
//       'password': password
//     };
//   }

//   factory User.fromMapToObject(Map<String, dynamic> map) {
//     return User(
//       id: map['id'], 
//       email: map['email'] as String, 
//       password: map['password'] as String
//     );
//   }
// }






























class User {
  final int? id;
  final String email;
  final String password;

  User({this.id, 
        required this.email, 
        required this.password});

  Map<String, dynamic> fromObjectToMap() {
    return {
      "id": id,
      "email": email,
      "password": password
    };
  } 

  factory User.fromMapToObject(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'] as String, 
      password: map['password'] as String 
    );
  }
}