part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginSubmitted extends LoginEvent {
  final LoginReqModel loginReqModel;

  LoginSubmitted(this.loginReqModel);

  @override
  List<Object> get props => [loginReqModel];
}
