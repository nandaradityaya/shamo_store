import 'package:shamo_store/models/product_model.dart';

class CartModel {
  late int id;
  late ProductModel product; // ambil dari product_model.dart
  late int quantity;

  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = ProductModel.fromJson(
        json['product']); // fromJson lagi karena product itu object
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  // method untuk menghitung total harga
  double getTotalPrice() {
    return product.price * quantity;
  }
}
