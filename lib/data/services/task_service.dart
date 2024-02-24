import 'dart:convert';

import 'package:bloc_todos_app/data/models/create_task_req_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Exceptions/common_errors.dart';
import '../../utilities/constants.dart';
import '../models/task_res_model.dart';
import '../models/user_res_model.dart';

class TaskService {
  Future<TaskResModel> getAllTasks() async {
    String errorMessage = '';
    try {
      final prefs = await SharedPreferences.getInstance();
      final userInfo = prefs.getString(userInfoKey);
      final user = json.decode(userInfo!);
      final userModel = UserResModel.fromJson(user);
      final url = Uri.parse('$baseUrl/api/todos?per_page=100&page=1');
      final response = await http.get(
        url,
        headers: {
          'authorization': 'Bearer ${userModel.token}',
          'Accept': 'application/json',
        },
      );
      final responseJson = json.decode(response.body);
      // print(responseJson);
      if (response.statusCode == 200) {
        // print(responseJson);
        return TaskResModel.fromJson(responseJson);
      } else {
        final message = responseJson['message'] as Map<String, dynamic>;

        // Loop through the message map and append each error message
        message.forEach((key, value) {
          // Assuming each value is a list of messages
          List<dynamic> messages = value;
          errorMessage += '${messages.join(' ')}\n';
        });

        // Remove the last newline character
        if (errorMessage.isNotEmpty) {
          errorMessage = errorMessage.substring(0, errorMessage.length - 1);
        }
        print(errorMessage);
        throw UnauthorisedException(errorMessage);
      }
    } catch (e) {
      print(e.toString());
      throw errorMessage;
    }
  }

  Future<bool> createTask(CreateTaskReqModel reqModel) async {
    String errorMessage = '';
    try {
      final prefs = await SharedPreferences.getInstance();
      final userInfo = prefs.getString(userInfoKey);
      final user = json.decode(userInfo!);
      final userModel = UserResModel.fromJson(user);
      final url = Uri.parse('$baseUrl/api/todos-create');
      final response = await http.post(
        url,
        headers: {
          'authorization': 'Bearer ${userModel.token}',
          'Accept': 'application/json',
        },
        body: reqModel.toJson(),
      );
      final responseJson = json.decode(response.body);
      // print(responseJson);
      if (response.statusCode == 200) {
        return true;
      } else {
        final message = responseJson['message'] as Map<String, dynamic>;

        // Loop through the message map and append each error message
        message.forEach((key, value) {
          // Assuming each value is a list of messages
          List<dynamic> messages = value;
          errorMessage += '${messages.join(' ')}\n';
        });

        // Remove the last newline character
        if (errorMessage.isNotEmpty) {
          errorMessage = errorMessage.substring(0, errorMessage.length - 1);
        }
        print(errorMessage);
        throw BadRequestException(errorMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
