import 'package:flutter/material.dart';
import 'package:shamo_store/theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
          width: 215,
          height: 278,
          margin: const EdgeInsets.only(right: defaultMargin),
          decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 7,
                  offset: const Offset(3, 3),
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/image_shoes.png',
                width: 215,
                height: 150,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hiking',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text('COURT VISION 2.0 SHOES',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow
                              .ellipsis), // klo tulisannya panjang jadi titik titik
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
                    ]),
              )
            ],
          )),
    );
  }
}
