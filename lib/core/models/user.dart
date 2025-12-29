enum UsersTableKeys {
  id,
  name,
  email,
  password,
  gender,
  image,
  fcmToken,
  token,
  refreshToken,
  isActive,
  // isVerified,
  // isBlocked,
  // address,
  // phone,
  // dob,
  // createdAt,
  // updatedAt,
  // isDeleted,
  // deletedAt,
  // role,
}

class User {
  static const String tableName = "users";

  late int id;
  late String firstName;
  late String lastName;
  late String email;
  late String mobile;
  late String bio;
  late String jobTitle;
  late String longtude;
  late String latitude;
  late String image;
  late String active;
  late String emailVerified;
  late String imageCount;
  late String password;
  late String? token;
  late String? refreshToken;



  User();

  Map<String, dynamic> to() {
    Map<String, dynamic> row = <String, dynamic>{};
    row[UsersTableKeys.id.name] = id;
    row[UsersTableKeys.name.name] = name;
    row[UsersTableKeys.email.name] = email;
    row[UsersTableKeys.image.name] = image;
    row[UsersTableKeys.password.name] = password;
    return row;
  }

  User.from(Map<String, dynamic> map) {
    id = map[UsersTableKeys.id.name];
    name = map[UsersTableKeys.name.name];
    email = map[UsersTableKeys.email.name];
    image = map[UsersTableKeys.image.name];
    // password = map['password'];
  }

}