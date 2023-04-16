import 'package:flutter/material.dart';
import 'package:shamo_store/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Sign In to Continue",
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 70,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: backgroundColor1,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Center(
                child: Row(children: [
                  Image.asset(
                    'assets/icon-email.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: TextFormField(
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: "Your Email Address",
                      hintStyle: subtitleTextStyle,
                    ),
                  ))
                ]),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: backgroundColor1,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Center(
                child: Row(children: [
                  Image.asset(
                    'assets/icon-password.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: TextFormField(
                    obscureText: true,
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: "Your Password",
                      hintStyle: subtitleTextStyle,
                    ),
                  ))
                ]),
              ),
            )
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            child: Text(
              'Sign In',
              style: primaryTextButton.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ));
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text(
                "Sign Up",
                style: blueTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor1,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    emailInput(),
                    passwordInput(),
                    signInButton(),
                    const Spacer(),
                    footer(),
                  ],
                ))));
  }
}