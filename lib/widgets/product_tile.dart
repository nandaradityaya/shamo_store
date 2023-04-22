import 'package:flutter/material.dart';
import 'package:shamo_store/theme.dart';
import 'package:shamo_store/models/product_model.dart';
import 'package:shamo_store/pages/product_page.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

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
                child: Image.network(
                  product.galleries[0].url, // ambil gambar pertama
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
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                      maxLines:
                          1, // maxLines untuk klo tulisannya panjang jadi satu baris
                      // overflow: TextOverflow
                      //     .ellipsis // overflow untuk klo tulisannya panjang jadi titik titik
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
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
