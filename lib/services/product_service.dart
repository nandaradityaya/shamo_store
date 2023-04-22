import 'dart:convert'; // dart convert untuk mengubah data menjadi json

import 'package:http/http.dart' as http;
import 'package:shamo_store/models/product_model.dart';

class ProductService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  // dia akan mengembalikan data dengan tipe data Future<List<ProductModel>>
  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';

    var headers = {
      'Content-Type': 'application/json'
    }; // sesuaikan dengan header yang ada di postman

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data'][
            'data']; // decode data dari json | data['data'] karena data yang diambil dari backend ada 2 data, data pertama adalah data yang kita butuhkan, data kedua adalah data untuk pagination | liat di postman product, datanya itu ada dua
        List<ProductModel> products = []; // inisialisasi list kosong

        for (var item in data) {
          products.add(ProductModel.fromJson(
              item)); // product.add untuk menambahkan data ke list yg awalnya kosong
        }

        return products;
      } else {
        throw Exception('Gagal Get Product');
      }
    } catch (e) {
      rethrow;
    }
  }
}
