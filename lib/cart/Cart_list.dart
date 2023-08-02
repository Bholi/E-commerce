import 'package:e_commerce/cart/cartScreen.dart';

import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  const CartList(Widget pag, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.logout_outlined))],
        title: Text("E-Commerce"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return const Card_Screen_List();
        },
      ),
    );
  }
}
