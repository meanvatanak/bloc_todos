import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_model.dart';
import '../../data/models/user_res_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../utilities/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final authRepository = AuthRepository();

  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  AuthCubit() : super(const AuthState.unknown()) {
    // initialization
    _authenticationStatusSubscription =
        authRepository.status.listen(_onAuthenticationStatusChanged);
  }

  void _onAuthenticationStatusChanged(AuthenticationStatus status) {
    switch (status) {
      case AuthenticationStatus.authenticated:
        emit(AuthState.authenticated(User.empty));
        break;
      case AuthenticationStatus.unauthenticated:
        emit(const AuthState.unauthenticated());
        break;
      default:
        emit(const AuthState.unknown());
    }
  }

  void initialization() async {
    final prefs = await SharedPreferences.getInstance();
    final userInfoLocal = prefs.getString(userInfoKey);

    if (userInfoLocal != null) {
      final userDecoded = json.decode(userInfoLocal);
      final userInfo = UserResModel.fromJson(userDecoded);
      final authUser = User(
        id: userInfo.id,
        username: userInfo.username,
        phone: userInfo.phone,
        email: userInfo.email,
        gender: userInfo.gender,
        image: userInfo.image ?? '',
        token: userInfo.token ?? '',
      );
      emit(AuthState.authenticated(authUser));
    } else {
      print('no user info');
      emit(const AuthState.unauthenticated());
    }
  }

  // void logged(User user) async {}

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    authRepository.dispose();
    return super.close();
  }
}
