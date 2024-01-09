import 'package:bloc_todos_app/bloc/login/login_bloc.dart';
import 'package:bloc_todos_app/data/models/login_req_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/constants.dart';
import '../../widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  void _onLoginButtonPressed() {
    final requestModel = LoginReqModel(
      username: _usernameController.text,
      password: _passwordController.text,
    );
    context.read<LoginBloc>().add(
          LoginSubmitted(requestModel),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, '/main');
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
          return Scaffold(
            body: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo/logo.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomTextField(
                      controller: _usernameController,
                      hintText: 'Username',
                      labelText: 'Enter Your Username',
                      prefixIcon: Icon(Icons.person),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      labelText: 'Enter Your Password',
                      prefixIcon: Icon(Icons.password),
                      isPassword: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton.icon(
                        onPressed: _onLoginButtonPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: Icon(Icons.login, color: whiteColor),
                        label: Text(
                          'Login',
                          style: TextStyle(
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'Register Now!',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
