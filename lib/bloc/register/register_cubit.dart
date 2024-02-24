import 'package:bloc/bloc.dart';
import 'package:bloc_todos_app/data/models/register_req_model.dart';
import 'package:bloc_todos_app/data/models/register_res_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final _authRepository = AuthRepository();

  void register(RegisterReqModel registerReqModel) async {
    emit(RegisterLoading());
    try {
      final result = await _authRepository.register(registerReqModel);
      emit(RegisterSuccess(result.user));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
