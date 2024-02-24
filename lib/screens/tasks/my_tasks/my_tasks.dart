import 'package:bloc_todos_app/bloc/categories/get_all_category/get_category_bloc.dart';
import 'package:bloc_todos_app/bloc/tasks/get_all_task/get_task_cubit.dart';
import 'package:bloc_todos_app/utilities/constants.dart';
import 'package:bloc_todos_app/widgets/tasks/add_task.dart';
import 'package:bloc_todos_app/widgets/tasks/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/tasks/create_task/create_task_bloc.dart';

class MyTasks extends StatefulWidget {
  const MyTasks({super.key});

  @override
  State<MyTasks> createState() => _MyTasksState();
}

class _MyTasksState extends State<MyTasks> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetTaskCubit()..getAllTasks(),
        ),
        BlocProvider(
          create: (context) => CreateTaskBloc(),
        ),
      ],
      child: _MyTasks(),
    );
  }
}

class _MyTasks extends StatelessWidget {
  _MyTasks({super.key});

  void _addTask(BuildContext context) {
    BlocProvider.of<GetCategoryBloc>(context).add(GetAllCategory());
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddTask(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Tasks(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
