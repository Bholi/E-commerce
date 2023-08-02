import 'package:e_commerce/common/botombar/resources/product_repository.dart';
import 'package:e_commerce/features/auth/cubit/SignUpCubit.dart';
import 'package:e_commerce/features/auth/resources/user_repository.dart';
import 'package:e_commerce/features/auth/ui/splash/cubit/startup_cubit.dart';
import 'package:e_commerce/features/auth/ui/splash/pages/widgets/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProductRepository(
            userRepository: RepositoryProvider.of<UserRepository>(context)),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<StartUpCubit>(
            create: (context) => StartUpCubit(userRepository: UserRepository())
              ..fetchStartUpData(),
          ),
          BlocProvider<SignUpCubit>(
            create: (context) => SignUpCubit(
              userRepository: UserRepository(),
            ),
          ),
        ],
        child: const MaterialApp(
          home: SplashWidget(),
        ),
      ),
    );
  }
}
