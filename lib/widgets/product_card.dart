import 'package:flutter/material.dart';
import 'package:shamo_store/theme.dart';
import 'package:shamo_store/models/product_model.dart';
import 'package:shamo_store/pages/product_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

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
              Image.network(
                product.galleries[0].url, // ambil gambar pertama
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
                        product.category.name,
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        product.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow
                            .ellipsis, // klo tulisannya panjang jadi titik titik
                        maxLines: 1, // maksimal tulisan 1 baris
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '\$${product.price}',
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
