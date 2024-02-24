import 'dart:async';

import 'package:bloc_todos_app/data/models/login_req_model.dart';
import 'package:bloc_todos_app/data/models/login_res_model.dart';
import 'package:bloc_todos_app/data/models/register_req_model.dart';
import 'package:bloc_todos_app/data/services/auth_service.dart';

import '../models/register_res_model.dart';
import '../models/user_info_res_model.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  final authServices = AuthService();
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<LoginResModel> logIn(LoginReqModel reqModel) async {
    try {
      final result = await authServices.login(reqModel);
      _controller.add(AuthenticationStatus.authenticated);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<UserInfoResModel> getUserInfo(int userId, String token) async {
    try {
      final result = await authServices.getUserInfo(
        userId,
        token,
      );
      print(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout(int userId) async {
    return await authServices.logout(userId);
  }

  Future<RegisterResModel> register(RegisterReqModel registerReq) async {
    try {
      final result = await authServices.register(registerReq);
      print(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  void dispose() => _controller.close();
}
