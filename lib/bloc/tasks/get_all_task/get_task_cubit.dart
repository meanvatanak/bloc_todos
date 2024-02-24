import 'package:bloc/bloc.dart';
import 'package:bloc_todos_app/data/repositories/task_respository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/task_res_model.dart';

part 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  GetTaskCubit() : super(GetTaskInitial());

  final TaskRepository repository = TaskRepository();

  void getAllTasks() async {
    emit(GetTaskLoading());
    try {
      final TaskResModel taskResModel = await repository.getAllTasks();
      // print(taskResModel);
      emit(GetTaskSuccess(taskResModel));
    } catch (e) {
      print(e.toString());
      emit(GetTaskFailure(e.toString()));
    }
  }
}
