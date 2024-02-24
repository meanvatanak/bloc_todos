import 'dart:convert';

import 'package:bloc_todos_app/Exceptions/common_errors.dart';
import 'package:bloc_todos_app/data/models/register_req_model.dart';
import 'package:bloc_todos_app/data/models/register_res_model.dart';
import 'package:http/http.dart' as http;

import '../../utilities/constants.dart';
import '../models/login_req_model.dart';
import '../models/login_res_model.dart';
import '../models/user_info_res_model.dart';

class AuthService {
  Future<LoginResModel> login(LoginReqModel requestModel) async {
    try {
      String url = "$baseUrl/api/login";
      final response = await http.post(
        Uri.parse(url),
        body: requestModel.toJson(),
      );

      final resultDecoded = jsonDecode(response.body);
      // print(resultDecoded);
      if (response.statusCode == 200) {
        return LoginResModel.fromJson(resultDecoded);
      } else if (response.statusCode == 401) {
        final message = resultDecoded['message'] as Map<String, dynamic>;

        // Create a string to hold the error messages
        String errorMessage = '';

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

        throw UnauthorisedException(errorMessage);
      } else if (response.statusCode == 400) {
        throw BadRequestException('Bad Request');
      } else {
        final message = resultDecoded['message'] as Map<String, dynamic>;

        // Create a string to hold the error messages
        String errorMessage = '';

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

        throw UnauthorisedException(errorMessage);
        // throw SomethingWentWrongException();
      }
    } catch (e) {
      rethrow; //SomethingWentWrongException();
      // rethrow;
    }
  }

  Future<UserInfoResModel> getUserInfo(int userId, String token) async {
    late String errorMessage;
    try {
      final url = Uri.parse('$baseUrl/api/user/$userId');
      final response = await http.get(
        url,
        headers: {
          'authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      // print(response.body);
      final responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        return UserInfoResModel.fromJson(responseJson);
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
        throw UnauthorisedException(errorMessage);
      }
    } catch (e) {
      // final String errorMessage = e.toString();
      throw errorMessage;
    }
  }

  Future<RegisterResModel> register(RegisterReqModel reqModel) async {
    String errorMessage = '';
    try {
      final url = Uri.parse('$baseUrl/api/register');
      final response = await http.post(
        url,
        body: reqModel.toJson(),
        headers: {'Accept': 'application/json'},
      );
      final decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (response.statusCode == 200) {
        return RegisterResModel.fromJson(decodedResponse);
      } else {
        final message = decodedResponse['message'] as Map<String, dynamic>;

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
        throw UnauthorisedException(errorMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout(int userId) async {
    try {
      final url = Uri.parse('$baseUrl/api/logout');
      final response = await http.post(
        url,
        body: {
          'user_id': userId.toString(),
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
