import 'package:bloc_todos_app/data/models/user_res_model.dart';

class UserInfoResModel {
  late final String message;
  late final int statusCode;
  late final UserResModel user;

  UserInfoResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    user = UserResModel.fromJson(json['data']);
  }
}
