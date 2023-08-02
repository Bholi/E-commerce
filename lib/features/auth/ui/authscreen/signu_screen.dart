import 'package:e_commerce/features/auth/cubit/SignUpCubit.dart';
import 'package:e_commerce/features/auth/resources/user_repository.dart';
import 'package:e_commerce/features/auth/ui/authscreen/SignUp.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => SignUpCubit(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: const SignUpWidget(),
    );
  }
}
