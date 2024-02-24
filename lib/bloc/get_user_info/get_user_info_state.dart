part of 'get_user_info_cubit.dart';

abstract class GetUserInfoState extends Equatable {
  const GetUserInfoState();
}

class GetUserInfoInitial extends GetUserInfoState {
  @override
  List<Object> get props => [];
}

class GetUserInfoLoading extends GetUserInfoState {
  @override
  List<Object> get props => [];
}

class GetUserInfoSuccess extends GetUserInfoState {
  final UserResModel user;

  GetUserInfoSuccess(this.user);
  
  @override
  List<Object> get props => [user];
}

class GetUserInfoFailure extends GetUserInfoState {
  final String message;

  GetUserInfoFailure(this.message);

  @override
  List<Object> get props => [message];
}
