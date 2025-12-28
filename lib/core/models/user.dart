enum UsersTableKeys {
  id,
  name,
  email,
  password,
}

class User {
  static const String tableName = "users";

  late int id;
  late String name;
  late String email;
  late String password;

  User();

  Map<String, dynamic> to() {
    Map<String, dynamic> row = <String, dynamic>{};
    row['id'] = id;
    row['name'] = name;
    row['email'] = email;
    row['password'] = password;
    return row;
  }

  User.from(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }

}