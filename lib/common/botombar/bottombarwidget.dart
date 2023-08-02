import 'package:e_commerce/cart/Cart_list.dart';
import 'package:e_commerce/cart/cartScreen.dart';
import 'package:e_commerce/Orders/OrderScreen.dart';
import 'package:e_commerce/Orders/OrderScreenList.dart';
import 'package:e_commerce/common/botombar/Scroll/home/homepage.dart';


import 'package:e_commerce/features/auth/resources/user_repository.dart';

import 'package:e_commerce/features/auth/ui/authscreen/signIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class BottomBarWidgets extends StatefulWidget {
  const BottomBarWidgets({super.key});

  @override
  State<BottomBarWidgets> createState() => _BottomBarWidgetsState();
}

class _BottomBarWidgetsState extends State<BottomBarWidgets> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ExplorePage(),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "E-Commerce",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                RepositoryProvider.of<UserRepository>(context).logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    child: const SignUpScreen(),
                    type: PageTransitionType.fade,
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.house_outlined,
              color: Colors.black,
            ),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store_outlined),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.view_in_ar),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const HomePageScreen();
  }
}

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CartList(Card_Screen_List());
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const OrderScreenList(Orders_Screen());
  }
}
