import 'package:bloc_todos_app/bloc/auth/auth_cubit.dart';
import 'package:bloc_todos_app/bloc/get_user_info/get_user_info_cubit.dart';
import 'package:bloc_todos_app/bloc/login/login_bloc.dart';
import 'package:bloc_todos_app/bloc/logout/logout_cubit.dart';
import 'package:bloc_todos_app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/categories/get_all_category/get_category_bloc.dart';
import 'bloc/register/register_cubit.dart';
import 'bloc/save_user_info/save_user_info_cubit.dart';

void main() {
  // Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthCubit()..initialization(),
      ),
      BlocProvider(
        create: (context) => GetUserInfoCubit(),
      ),
      BlocProvider(
        create: (context) => SaveUserInfoCubit(),
      ),
      BlocProvider(
        create: (context) => LoginBloc(),
      ),
      BlocProvider(
        create: (context) => LogoutCubit(),
      ),
      BlocProvider(
        create: (context) => RegisterCubit(),
      ),
      BlocProvider(
        create: (context) => GetCategoryBloc()..add(GetAllCategory()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Todos App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: appRoute,
    );
  }
}
