import 'dart:async';

import 'package:bloc_todos_app/data/models/login_req_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.unknown());

  final authRepository = AuthRepository();

  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  void _onAuthenticationStatusChanged(AuthenticationStatus status) {}

  void logIn(LoginReqModel reqModel) async {
    await authRepository.logIn(reqModel);
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    authRepository.dispose();
    return super.close();
  }
}
