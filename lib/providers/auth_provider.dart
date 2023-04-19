import 'package:flutter/cupertino.dart';
import 'package:shamo_store/models/user_model.dart';
import 'package:shamo_store/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel
      _user; // late artinya akan diinisialisasi nanti, jadi biar ga kena null safety

  UserModel get user => _user; // getter untuk mengambil data user

  // setter untuk mengubah data user
  set user(UserModel user) {
    _user = user;
    notifyListeners(); // untuk memberitahu bahwa data user sudah berubah
  }

  // fungsi untuk register (pake bool karena untuk ngasih tau nanti berhasil atau tidak)
  Future<bool> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    // try catch untuk menangkap berhasil atau error registernya
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user =
          user; // setelah berhasil register, maka ubah state awal _user menjadi user yang baru
      return true; // return true karena berhasil register
    } catch (e) {
      return false; // return false karena gagal register
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }
}
