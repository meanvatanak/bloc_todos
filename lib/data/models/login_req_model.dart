class LoginReqModel {
  LoginReqModel({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
