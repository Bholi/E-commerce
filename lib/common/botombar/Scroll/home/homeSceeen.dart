import 'package:e_commerce/common/bloc/common_state.dart';
import 'package:e_commerce/common/botombar/Scroll/product/productWidget.dart';
import 'package:e_commerce/common/botombar/cubit/fetch_product_cubit.dart';
import 'package:e_commerce/common/botombar/model/product.dart';

import 'package:e_commerce/common/botombar/resources/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final Product product;
  const HomeScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchProductCubitCubit(
          repository: RepositoryProvider.of<ProductRepository>(context))
        ..fetchProducts(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              width: 400,
              height: 300,
              child: BlocBuilder<FetchProductCubitCubit, CommonState>(
                builder: (context, state) {
                  if (state is CommonSuccessState) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pop(MaterialPageRoute(builder: (context) {
                              return const Product_widget_Page();
                            }));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                product.image,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 200),
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 285),
                          child: Text(
                            product.brand,
                            style: const TextStyle(
                                color: Colors.black12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            right: 250,
                          ),
                          child: Text(
                            "${product.price}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
