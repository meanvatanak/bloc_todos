import 'dart:async';

import 'package:bloc_todos_app/data/models/login_req_model.dart';
import 'package:bloc_todos_app/data/models/login_res_model.dart';
import 'package:bloc_todos_app/data/services/auth_service.dart';

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

  void dispose() => _controller.close();
}
