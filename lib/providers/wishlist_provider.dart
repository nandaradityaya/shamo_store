import 'package:flutter/cupertino.dart';
import 'package:shamo_store/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishlist = []; // inisialisasi list kosong untuk awa;

  List<ProductModel> get wishlist =>
      _wishlist; // getter untuk mengambil data products

  // setter untuk mengubah data products
  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist; // set jadi wishlist
    notifyListeners();
  }

  // set product yang akan di tambah atau di hapus
  setProduct(ProductModel product) {
    // klo dia gada di dalam wishlist maka tambahin ke wishlist
    if (!isWishlist(product)) {
      _wishlist.add(product);
    } else {
      // klo ada di wishlist maka hapus berdasarkan id
      _wishlist.removeWhere((element) => element.id == product.id);
    }

    notifyListeners(); // untuk memberitahu bahwa data products sudah berubah
  }

  isWishlist(ProductModel product) {
    // cek apakah product.id ada di wishlist | kalau ada maka return true kalau gaada yaitu -1 maka return false
    if (_wishlist.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
