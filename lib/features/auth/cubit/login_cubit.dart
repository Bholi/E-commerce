import 'package:e_commerce/common/bloc/common_state.dart';
import 'package:e_commerce/features/auth/resources/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<CommonState> {
  final UserRepository repository;
  LoginCubit({required this.repository}) : super(CommonInitialState());

  login({
    required String email,
    required String password,
  }) async {
    emit(CommonLoadingState());
    final res = await repository.login(
      email: email,
      password: password,
    );
    res.fold(
      (err) => emit(CommonErrorState(message: err)),
      (data) => emit(CommonSuccessState(item: null)),
    );
  }
}
