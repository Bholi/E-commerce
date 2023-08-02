
import 'package:e_commerce/common/bloc/common_state.dart';
import 'package:e_commerce/features/auth/resources/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<CommonState> {
  final UserRepository userRepository;
  SignUpCubit({ required this.userRepository}) :super(CommonInitialState());
   signUp({
    required String  fullName,
    required String phoneNumber,
  required String address, 
   required String email,
    required String password,
   }) async {
emit(CommonLoadingState());
final res = await userRepository.signUp(
   fullName: fullName,
   phoneNumber: phoneNumber,
    address: address, email: email, 
    password: password,
    );
    res.fold(
     (err) => emit(CommonErrorState(message: err)),
     (data) => emit(CommonSuccessState(item: null)), 
     );
   }
}