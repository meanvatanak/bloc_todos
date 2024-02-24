part of 'create_task_bloc.dart';

abstract class CreateTaskEvent extends Equatable {
  const CreateTaskEvent();
}

class CreateTask extends CreateTaskEvent {
  final CreateTaskReqModel createTaskReqModel;

  CreateTask(this.createTaskReqModel);

  @override
  List<Object> get props => [createTaskReqModel];
}
