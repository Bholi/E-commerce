
import 'package:e_commerce/common/bloc/common_state.dart';
import 'package:e_commerce/common/botombar/bottombarwidget.dart';
import 'package:e_commerce/features/auth/ui/authscreen/signIn_screen.dart';
import 'package:e_commerce/features/auth/ui/splash/cubit/startup_cubit.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocListener<StartUpCubit, CommonState>(
        listener: (context, state) {
          if(state is CommonErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
          if(state is CommonSuccessState<bool>){
           if(state.item){
            //HomeScreen ko lagi ho
            Navigator.of(context).pushAndRemoveUntil(
              PageTransition(
                child:BottomBarWidgets(),
                type: PageTransitionType.fade
              ), (route) => false);
           }
           else{
             Navigator.of(context).pushAndRemoveUntil(
              PageTransition(
                child: SignUpScreen(),
                type: PageTransitionType.fade
              ), (route) => false);
           }
          }
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/logo.jpg",
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

