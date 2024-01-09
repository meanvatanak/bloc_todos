part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

// Login Loading State
class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

// Login Success State
class LoginSuccess extends LoginState {
  final LoginResModel data;

  LoginSuccess(this.data);

  @override
  List<Object> get props => [data];
}

// Login Failure State
class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);

  @override
  List<Object> get props => [message];
}
