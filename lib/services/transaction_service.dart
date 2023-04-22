import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shamo_store/models/cart_model.dart';

class TransactionService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
  ) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token, // butuh token untuk checkout, jadi wajib login
    }; // sesuaikan dengan header yang ada di postman checkout
    var body = jsonEncode({
      'address': 'Bandung',
      'items': carts
          .map(
            (cart) => {
              'id': cart.product.id, // ambil id dari product
              'quantity': cart.quantity,
            },
          )
          .toList(),
      'status': "PENDING",
      'total_price': totalPrice,
      'shipping_price': 0, // shipping pricenya free
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw 'Gagal melakukan checkout.';
    }
  }
}
