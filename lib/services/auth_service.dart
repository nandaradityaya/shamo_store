// untuk request ke dalam back end

import 'dart:convert';

import 'package:shamo_store/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl =
      'https://shamo-backend.buildwithangga.id/api'; // sesuaikan dengan url backend di postman
  // 'https://192.168.1.4:8000/api'; // sesuaikan dengan url backend di postman

  Future<UserModel> register({
    // sesuaikan dengan field yang ada pada halaman register
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      var url =
          '$baseUrl/register'; // sesuaikan dengan url backend di postman (register)
      var headers = {
        'Content-Type': 'application/json'
      }; // sesuaikan dengan header yang ada di postman (register)
      var body = jsonEncode({
        // fungsi encode untuk mengubah data menjadi json
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      }); // sesuaikan dengan body yang ada di postman (register)

      // request ke backend
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data']; // decode data dari json
        UserModel user = UserModel.fromJson(data[
            'user']); // konversi dari json ke UserModel | ambil dari data yg keynya user
        user.token =
            'Bearer ${data['access_token']}'; // ambil dari data yg keynya access_token

        return user;
      } else {
        throw Exception('Gagal Register');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    try {
      var url = '$baseUrl/login';
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'email': email,
        'password': password,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        UserModel user = UserModel.fromJson(data['user']);
        user.token = 'Bearer ${data['access_token']}';

        return user;
      } else {
        throw Exception('Gagal Login');
      }
    } catch (e) {
      rethrow;
    }
  }
}
