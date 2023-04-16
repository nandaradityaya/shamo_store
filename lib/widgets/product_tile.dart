import 'package:flutter/material.dart';
import 'package:shamo_store/theme.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
          margin: const EdgeInsets.only(
              top: 30,
              left: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin),
          child: Row(
            children: [
              ClipRRect(
                // cliprrect buat bikin image jadi kotak ada border radius
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/image_shoes.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                // pake Expanded biar sisanya diisi sama text
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Football',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Predator 20.3 Firm Ground',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                      // overflow: TextOverflow
                      //     .ellipsis // overflow untuk klo tulisannya panjang jadi titik titik
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '\$143,98',
                      style: priceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
