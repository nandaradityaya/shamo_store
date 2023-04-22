import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_store/providers/product_provider.dart';
import 'package:shamo_store/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState

    getInit();

    super.initState();
  }

  // set timer splash screen jadi pake kaya gini
  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false)
        .getProducts(); // panggil fungsi getProducts dari ProductProvider | listen: false biar ga rebuild

    Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
          child: Container(
        width: 130,
        height: 150,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image_splash.png'),
          ),
        ),
      )),
    );
  }
}
