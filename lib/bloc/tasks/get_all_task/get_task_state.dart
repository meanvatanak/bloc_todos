part of 'get_task_cubit.dart';

abstract class GetTaskState extends Equatable {
  const GetTaskState();
}

class GetTaskInitial extends GetTaskState {
  @override
  List<Object> get props => [];
}

class GetTaskLoading extends GetTaskState {
  @override
  List<Object> get props => [];
}

class GetTaskSuccess extends GetTaskState {
  final TaskResModel taskResModel;

  GetTaskSuccess(this.taskResModel);

  @override
  List<Object> get props => [taskResModel];
}

class GetTaskFailure extends GetTaskState {
  final String message;

  GetTaskFailure(this.message);

  @override
  List<Object> get props => [message];
}
