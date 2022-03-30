//// @dart=2.9
class User {
  int? userId;
  String? name;
  String? email;
  String? phone;
  int? userType;
  String? token;

  User({this.userId, this.name, this.email, this.phone, this.userType, this.token});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        userId: responseData['id'],
        name: responseData['name'],
        email: responseData['email'],
        phone: responseData['phone'],
        userType: responseData['user_type'],
        token: responseData['token'],
    );
  }
}
