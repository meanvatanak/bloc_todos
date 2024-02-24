part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccess extends RegisterState {
  final RegisterUserModel data;

  RegisterSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure(this.message);

  @override
  List<Object> get props => [message];
}
