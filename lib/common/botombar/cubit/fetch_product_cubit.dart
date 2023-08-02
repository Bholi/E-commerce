import 'package:e_commerce/common/bloc/common_state.dart';
import 'package:e_commerce/common/botombar/model/product.dart';
import 'package:e_commerce/common/botombar/resources/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchProductCubitCubit extends Cubit<CommonState> {
  final ProductRepository repository;
  FetchProductCubitCubit({required this.repository}) : super(CommonInitialState());


  fetchProducts() async {
    emit(CommonLoadingState());
    final res = await repository.fetchProducts();
    res.fold(
      (err) => emit(CommonErrorState(message: err)),
       (data) => emit(CommonSuccessState<List<Product>>(item: data)),
       );
  }
}