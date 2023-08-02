import 'package:e_commerce/common/bloc/common_state.dart';
import 'package:e_commerce/common/botombar/Scroll/home/homeSceeen.dart';
import 'package:e_commerce/common/botombar/cubit/fetch_product_cubit.dart';
import 'package:e_commerce/common/botombar/model/product.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Homewedget extends StatelessWidget {
  const Homewedget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProductCubitCubit, CommonState>(
      builder: (context, state) {
        if (state is CommonErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is CommonSuccessState<List<Product>>) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return HomeScreen( product: state.item[index],);
            },
            itemCount: state.item.length,
          );
        } else {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }
}
