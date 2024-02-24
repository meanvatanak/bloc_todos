import 'package:bloc_todos_app/bloc/tasks/get_all_task/get_task_cubit.dart';
import 'package:bloc_todos_app/widgets/tasks/edit_task.dart';
import 'package:bloc_todos_app/widgets/tasks/show_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tasks extends StatefulWidget {
  const Tasks({
    super.key,
  });

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  // Map of tasks
  final List<Map<String, dynamic>> tasksList = [
    {
      'name': 'Buy milk',
      'description': 'Buy milk from the supermarket',
      'due_date': '2024-04-10',
      'category_id': '4',
      'status': false,
      'deletedStatus': false,
    },
    {
      'name': 'Buy eggs',
      'description': 'Buy eggs from the supermarket',
      'due_date': '2024-01-10',
      'category_id': '4',
      'status': false,
      'deletedStatus': false,
    },
    {
      'name': 'Buy bread',
      'description': 'Buy bread from the supermarket',
      'due_date': '2024-10-10',
      'category_id': '4',
      'status': false,
      'deletedStatus': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTaskCubit, GetTaskState>(
      builder: (context, state) {
        if (state is GetTaskLoading) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (state is GetTaskSuccess) {
          if (state.taskResModel.data.isEmpty) {
            // return No tasks available with decoration
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.list_alt,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'No tasks available!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              itemCount: state.taskResModel.data.length,
              itemBuilder: (context, index) {
                final task = state.taskResModel.data[index];
                return ListTile(
                  title: Text(task.name),
                  leading: Checkbox(
                    value: task.status == 1 ? true : false,
                    onChanged: (value) {
                      setState(() {
                        task.status = value! ? 1 : 0;
                      });
                    },
                  ),
                  onLongPress: () {
                    setState(() {});
                  },
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: ShowTask(
                            name: task.name,
                            description: task.description,
                            dueDate: task.deuDate,
                            category: task.category,
                          ),
                        ),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: EditTask(),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        } else if (state is GetTaskFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Center(
            child: Text('Something went wrong!'),
          );
        }
      },
    );
  }
}
