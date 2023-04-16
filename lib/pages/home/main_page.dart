import 'package:flutter/material.dart';
import 'package:shamo_store/pages/home/chat_page.dart';
import 'package:shamo_store/pages/home/home_page.dart';
import 'package:shamo_store/pages/home/profile_page.dart';
import 'package:shamo_store/pages/home/wishlist_page.dart';
import 'package:shamo_store/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex =
      0; // agar ketika membuka main page maka yg di tampilkan adalah home page, valuenya adalah home page = 0, chat = 1, wishlist = 2, profile = 3

  @override
  Widget build(BuildContext context) {
    Widget cartButtton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset('assets/icon_cart.png', width: 20),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12, // lengkungan di bawah floating button
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: backgroundColor4,
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed, // untuk merapihkan icon
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_home.png',
                      width: 21,
                      color:
                          currentIndex == 0 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset('assets/icon_chat.png',
                        width: 20,
                        color: currentIndex == 1
                            ? primaryColor
                            : Color(0xff808191)),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset('assets/icon_wishlist.png',
                        width: 20,
                        color: currentIndex == 2
                            ? primaryColor
                            : Color(0xff808191)),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset('assets/icon_profile.png',
                        width: 18,
                        color: currentIndex == 3
                            ? primaryColor
                            : Color(0xff808191)),
                  ),
                  label: '',
                ),
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
          break;
        case 1:
          return const ChatPage();
          break;
        case 2:
          return const WishlistPage();
          break;
        case 3:
          return const ProfilePage();
          break;
        default:
          return const HomePage();
      }
    }

    return Scaffold(
        backgroundColor:
            currentIndex == 0 ? backgroundColor1 : backgroundColor3,
        floatingActionButton: cartButtton(),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .centerDocked, // centerDocked itu untuk floating buttonnya
        bottomNavigationBar: customBottomNav(),
        body: body());
  }
}
