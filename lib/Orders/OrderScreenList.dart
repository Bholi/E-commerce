import 'package:e_commerce/Orders/OrderScreen.dart';
import 'package:flutter/material.dart';

class OrderScreenList  extends StatelessWidget {
  const OrderScreenList (Widget pag, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.logout_outlined))],
        title: const Text("E-Commerce"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return const Orders_Screen();
        },
      ),
    );
  }
}