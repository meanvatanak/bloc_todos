import 'package:bloc_todos_app/data/models/user_res_model.dart';

class LoginResModel {
  LoginResModel({
    required this.message,
    required this.statusCode,
    required this.user,
  });

  late final String message;
  late final int statusCode;
  late final UserResModel user;

  LoginResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    user = UserResModel.fromJson(json['user']);
  }
}
