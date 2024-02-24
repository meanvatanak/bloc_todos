import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_res_model.dart';
import '../../utilities/constants.dart';

part 'save_user_info_state.dart';

class SaveUserInfoCubit extends Cubit<SaveUserInfoState> {
  SaveUserInfoCubit() : super(SaveUserInfoInitial());

  void save(UserResModel user) async {
    try {
      emit(SaveUserInfoLoading());
      final prefs = await SharedPreferences.getInstance();
      final userInfo = json.encode(user.toJson());
      final response = await prefs.setString(userInfoKey, userInfo);

      if (response) {
        emit(SaveUserInfoSuccess());
      } else {
        emit(SaveUserInfoFailure('Error saving user info'));
      }
    } catch (e) {
      emit(SaveUserInfoFailure(e.toString()));
    }
  }
}
