class RegisterReqModel {
  final String fullName;
  final String phone;
  final String gender;
  final String email;
  final String address;
  final String username;
  final String password;
  final String passwordConfirmation;

  RegisterReqModel({
    required this.fullName,
    required this.phone,
    required this.gender,
    required this.email,
    required this.address,
    required this.username,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['phone'] = phone;
    data['gender'] = gender;
    data['email'] = email;
    data['address'] = address;
    data['username'] = username;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    return data;
  }
}
