part of 'create_task_bloc.dart';

abstract class CreateTaskState extends Equatable {
  const CreateTaskState();
}

class CreateTaskInitial extends CreateTaskState {
  @override
  List<Object> get props => [];
}

class CreateTaskLoading extends CreateTaskState {
  @override
  List<Object> get props => [];
}

class CreateTaskSuccess extends CreateTaskState {
  @override
  List<Object> get props => [];
}

class CreateTaskFailure extends CreateTaskState {
  final String message;

  CreateTaskFailure(this.message);

  @override
  List<Object> get props => [message];
}
