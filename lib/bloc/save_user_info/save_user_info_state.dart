part of 'save_user_info_cubit.dart';

abstract class SaveUserInfoState extends Equatable {
  const SaveUserInfoState();
}

class SaveUserInfoInitial extends SaveUserInfoState {
  @override
  List<Object> get props => [];
}

class SaveUserInfoLoading extends SaveUserInfoState {
  @override
  List<Object> get props => [];
}

class SaveUserInfoSuccess extends SaveUserInfoState {
  @override
  List<Object> get props => [];
}

class SaveUserInfoFailure extends SaveUserInfoState {
  final String message;

  SaveUserInfoFailure(this.message);

  @override
  List<Object> get props => [message];
}
