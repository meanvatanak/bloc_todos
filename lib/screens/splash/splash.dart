import 'package:bloc_todos_app/bloc/auth/auth_cubit.dart';
import 'package:bloc_todos_app/bloc/get_user_info/get_user_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/save_user_info/save_user_info_cubit.dart';
import '../../utilities/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.authenticated) {
              print('authenticated');
              final userId = state.user?.id;
              final userToken = state.user?.token;
              context.read<GetUserInfoCubit>().info(userId!, userToken!);
            } else if (state.status == AuthStatus.unauthenticated) {
              print('unauthenticated');
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            }
          },
        ),
        BlocListener<GetUserInfoCubit, GetUserInfoState>(
          listener: (context, state) {
            if (state is GetUserInfoSuccess) {
              print('GetUserInfoSuccess');
              context.read<SaveUserInfoCubit>().save(state.user);
            } else if (state is GetUserInfoFailure) {
              print('GetUserInfoFailure');
              _removeUserInfo();
              Navigator.pushReplacementNamed(context, '/login');
            }
          },
        ),
        BlocListener<SaveUserInfoCubit, SaveUserInfoState>(
          listener: (context, state) {
            if (state is SaveUserInfoSuccess) {
              print('SaveUserInfoSuccess');
              Navigator.pushReplacementNamed(context, '/main');
            } else if (state is SaveUserInfoFailure) {
              print('SaveUserInfoFailure');
              Navigator.pushReplacementNamed(context, '/login');
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        //color white transparent 50%
                        color: whiteColor.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Center(
                        child: Container(
                          width: 275,
                          height: 275,
                          decoration: BoxDecoration(
                            color: whiteColor.withOpacity(0.50),
                            borderRadius: BorderRadius.circular(150),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Center(
                        child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            color: whiteColor.withOpacity(0.75),
                            borderRadius: BorderRadius.circular(150),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 36.0),
                      child: Center(
                        child: Container(
                          width: 225,
                          height: 225,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(150),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Image.asset('assets/logo/logo.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Text(
              'Mean Vatanak',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Purpose Learning Only, I'm using Flutter to build this project.",
                  style: TextStyle(
                    fontSize: 18,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _removeUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(userInfoKey);
  }
}
