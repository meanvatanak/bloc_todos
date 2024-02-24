import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user_res_model.dart';
import '../../data/repositories/auth_repository.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit() : super(GetUserInfoInitial());

  final authRepository = AuthRepository();

  void info(int userId, String token) async {
    try {
      emit(GetUserInfoLoading());
      final userResponse = await authRepository.getUserInfo(userId, token);
      // print('Emitting a new state: $state');
      emit(GetUserInfoSuccess(userResponse.user));
      // print('Emitting a new state: $state');
    } catch (e) {
      emit(GetUserInfoFailure(e.toString()));
    }
  }
}
