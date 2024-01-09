import 'dart:convert';

import 'package:bloc_todos_app/Exceptions/common_errors.dart';
import 'package:http/http.dart' as http;

import '../../utilities/constants.dart';
import '../models/login_req_model.dart';
import '../models/login_res_model.dart';

class AuthService {
  Future<LoginResModel> login(LoginReqModel requestModel) async {
    try {
      String url = "$baseUrl/api/login";
      final response = await http.post(
        Uri.parse(url),
        body: requestModel.toJson(),
      );

      final resultDecoded = jsonDecode(response.body);
      print(resultDecoded);
      if (response.statusCode == 200) {
        return LoginResModel.fromJson(resultDecoded);
      } else if (response.statusCode == 401) {
        final message = resultDecoded as Map<String, dynamic>;
        throw UnauthorisedException(message['message']);
        // throw UnauthorisedException('Username or password is incorrect');
      } else if (response.statusCode == 400) {
        throw BadRequestException('Bad Request');
      } else {
        throw SomethingWentWrongException();
      }
    } catch (e) {
      throw SomethingWentWrongException();
      // rethrow;
    }
  }
}
