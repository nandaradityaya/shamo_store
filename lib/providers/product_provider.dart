import 'package:flutter/material.dart';
import 'package:shamo_store/models/product_model.dart';
import 'package:shamo_store/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = []; // inisialisasi list kosong untuk awa;
  List<ProductModel> get products =>
      _products; // getter untuk mengambil data products

  set products(List<ProductModel> products) {
    _products = products; // setter untuk mengubah data products
    notifyListeners(); // untuk memberitahu bahwa data products sudah berubah
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService()
          .getProducts(); // panggil fungsi getProducts dari ProductService
      _products =
          products; // setelah berhasil getProducts, maka ubah state awal _products menjadi products yang baru
    } catch (e) {
      rethrow;
    }
  }
}
