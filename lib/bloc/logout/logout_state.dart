part of 'logout_cubit.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();
}

class LogoutInitial extends LogoutState {
  @override
  List<Object> get props => [];
}

class LogoutLoading extends LogoutState {
  @override
  List<Object> get props => [];
}

class LogoutSuccess extends LogoutState {
  @override
  List<Object> get props => [];
}

class LogoutFailure extends LogoutState {
  final String message;

  LogoutFailure(this.message);

  @override
  List<Object> get props => [message];
}
