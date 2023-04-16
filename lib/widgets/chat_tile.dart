import 'package:flutter/material.dart';
import 'package:shamo_store/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-chat');
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/image_shop_logo.png', width: 54),
                SizedBox(width: 12),
                Expanded(
                  // biar bisa di expand, biar kolom chat itu lebarnya segitu semua dan lebar sendiri. Dan supaya dia ga overflow juga
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        'Good night, This item is ready. I will send it tomorrow morning',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                        overflow: TextOverflow
                            .ellipsis, // biar kalau textnya terlalu panjang, dia akan di ellipsis atau jadi titik titik sisanya
                      ),
                    ],
                  ),
                ),
                Text('Now',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: light,
                    )),
              ],
            ),
            SizedBox(height: 12),
            Divider(
              thickness: 1,
              color: Color(0xff2b2939),
            )
          ],
        ),
      ),
    );
  }
}
