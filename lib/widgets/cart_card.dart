import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_store/models/cart_model.dart';
import 'package:shamo_store/providers/cart_provider.dart';
import 'package:shamo_store/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.cart}) : super(key: key);

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(cart.product.galleries[0].url),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                // expanded supaya text nya bisa di expand dan tidak overflow ke kanan
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.product.name,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '\$${cart.product.price}',
                      style: priceTextStyle,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart
                          .id); // panggil method addQuantity dari cartProvider untuk menambah quantity
                    },
                    child: Image.asset(
                      'assets/button_add.png',
                      width: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    cart.quantity
                        .toString(), // toString untuk mengubah int ke string, karena text hanya menerima string sedangkan quantity typenya intger
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart
                          .id); // panggil method reduceQuantity dari cartProvider untuk mengurangi quantity
                    },
                    child: Image.asset(
                      'assets/button_min.png',
                      width: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart
                  .id); // panggil method removeCart dari cartProvider untuk menghapus cart
            },
            child: Row(children: [
              Image.asset(
                'assets/icon_remove.png',
                width: 10,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: alertTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
