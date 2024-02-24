import 'package:bloc_todos_app/data/models/create_task_req_model.dart';
import 'package:bloc_todos_app/data/models/task_res_model.dart';
import 'package:bloc_todos_app/data/services/task_service.dart';

class TaskRepository {
  final TaskService service = TaskService();

  Future<TaskResModel> getAllTasks() async {
    final TaskResModel taskResModel = await service.getAllTasks();
    // print(taskResModel);
    return taskResModel;
  }

  Future<bool> createTask(CreateTaskReqModel reqModel) async {
    return await service.createTask(reqModel);
  }
}
