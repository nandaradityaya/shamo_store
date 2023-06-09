import 'package:flutter/material.dart';
import 'package:shamo_store/models/cart_model.dart';
import 'package:shamo_store/theme.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({Key? key, required this.cart}) : super(key: key);
  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: backgroundColor1,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
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
            // expanded membuat childnya mengisi semua ruang dan agar textnya juga tidak overflow ketika kepanjangan
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product.name,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow
                      .ellipsis, // agar textnya tidak overflow dan klo panjang menjadi titik titik titik
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '\$${cart.product.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '${cart.quantity} Items',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
