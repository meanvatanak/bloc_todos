import 'package:bloc/bloc.dart';
import 'package:bloc_todos_app/Exceptions/common_errors.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/login_req_model.dart';
import '../../data/models/login_res_model.dart';
import '../../data/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authRepository = AuthRepository();

  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        final response = await authRepository.logIn(event.loginReqModel);
        emit(LoginSuccess(response));
      } on UnauthorisedException catch (e) {
        emit(LoginFailure(e.message));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}
