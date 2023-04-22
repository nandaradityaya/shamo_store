import 'package:flutter/material.dart';
import 'package:shamo_store/models/cart_model.dart';
import 'package:shamo_store/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = []; // inisialisasi list kosong untuk awal;

  List<CartModel> get carts => _carts; // getter untuk mengambil data carts

  // setter untuk mengubah data carts
  set carts(List<CartModel> carts) {
    _carts = carts; // set dari _carts jadi carts
    notifyListeners(); // untuk memberitahu bahwa data carts sudah berubah
  }

  addCart(ProductModel product) {
    // jika prduknya sudah ada di cart maka tambah quantity saja
    if (productExist(product)) {
      int index = _carts.indexWhere((element) =>
          element.product.id == product.id); // cari index product yang sama
      _carts[index]
          .quantity++; // tambah quantity jika product sudah ada di cart
    } else {
      // jika product belum ada di cart maka tambah ke cart
      _carts.add(
        CartModel(
          id: _carts.length,
          product: product,
          quantity: 1, // mulai quantity dari 1
        ),
      );
    }

    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id); // hapus cart berdasarkan id

    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++; // tambah quantity berdasarkan id

    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity--; // kurangi quantity berdasarkan id

    // jika quantity sudah 0 maka hapus cart, jadi biar klo di kurangin terus ga jadi minus quantitynya
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }

    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity; // tambah quantity
    }

    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += item.quantity * item.product.price; // tambah quantity * price
    }

    return total;
  }

  productExist(ProductModel product) {
    // cek apakah product.id ada di carts | kalau ada maka return true kalau gaada di dalam cart yaitu -1 maka return false
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
