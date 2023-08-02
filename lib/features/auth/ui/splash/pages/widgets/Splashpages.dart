import 'package:e_commerce/features/auth/resources/user_repository.dart';
import 'package:e_commerce/features/auth/ui/splash/cubit/startup_cubit.dart';
import 'package:e_commerce/features/auth/ui/splash/pages/widgets/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => StartUpCubit(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      )..fetchStartUpData(),
      child: SplashWidget(),
    );
  }
}
