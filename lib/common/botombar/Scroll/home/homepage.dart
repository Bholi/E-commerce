import 'package:e_commerce/common/botombar/Scroll/home/homewidget.dart';
import 'package:e_commerce/common/botombar/cubit/fetch_product_cubit.dart';
import 'package:e_commerce/common/botombar/resources/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>FetchProductCubitCubit(
        repository: RepositoryProvider.of<ProductRepository>(context),
      )..fetchProducts(),
      child: const Homewedget(),
    );
  }
}
