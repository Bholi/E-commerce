import 'package:bloc/bloc.dart';
import 'package:e_commerce/common/bloc/common_state.dart';

import 'package:e_commerce/features/auth/resources/user_repository.dart';

class StartUpCubit extends Cubit<CommonState> {
  final UserRepository userRepository;
  StartUpCubit({required this.userRepository}) : super(CommonInitialState());

  fetchStartUpData() async {
    emit(CommonLoadingState());

    await Future.delayed(Duration(seconds: 2));

     await userRepository.initialize();
    emit(CommonSuccessState<bool>(item: userRepository.userToken.isNotEmpty));
  }
}
