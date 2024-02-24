import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_res_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../utilities/constants.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  final authRepository = AuthRepository();

  void logout() async {
    try {
      emit(LogoutLoading());
      final prefs = await SharedPreferences.getInstance();
      final userInfo = prefs.getString(userInfoKey);
      final user = json.decode(userInfo!);
      final userModel = UserResModel.fromJson(user);
      final status = await authRepository.logout(userModel.id);
      if (status) {
        prefs.remove(userInfoKey);
        emit(LogoutSuccess());
      } else {
        emit(LogoutFailure('Error logging out'));
      }
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}
