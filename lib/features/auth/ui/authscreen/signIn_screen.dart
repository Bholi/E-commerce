
import 'package:e_commerce/features/auth/cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/resources/user_repository.dart';
import 'package:e_commerce/features/auth/ui/authscreen/SignIn.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
     create: (context) => LoginCubit(
        repository: RepositoryProvider.of<UserRepository>(context)
      ),
      child: SignInwidgets(),
    );
  }
}
