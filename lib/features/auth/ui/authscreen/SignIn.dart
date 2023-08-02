import 'package:e_commerce/common/bloc/common_state.dart';
import 'package:e_commerce/common/botombar/bottombarwidget.dart';
import 'package:e_commerce/common/utils/Snackbar_utils.dart';
import 'package:e_commerce/features/auth/cubit/login_cubit.dart';

import 'package:e_commerce/features/auth/ui/authscreen/signu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:page_transition/page_transition.dart';

class SignInwidgets extends StatefulWidget {
  @override
  State<SignInwidgets> createState() => _SignInwidgetsState();
}

class _SignInwidgetsState extends State<SignInwidgets> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: false,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocListener<LoginCubit, CommonState>(
          listener: (context, state) {
            if(state is  CommonLoadingState){
              setState(() {
              });
            }else{
            }
             if( state is CommonSuccessState){
              SnackBarUtils.ShowMessage(
                context: context, message: "Login Successfully",
                );
              Navigator.of(context).pushAndRemoveUntil(
                PageTransition(
                child:  BottomBarWidgets(), 
                type: PageTransitionType.fade,
                ),
                (route) => false,
              );
             }else if(state is CommonErrorState){
              SnackBarUtils.ShowMessage(
                context: context, 
                message: state.message,
                );
             }

          },
          child: Container(
           
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 14),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        child: Container(
                          width: double.infinity,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.facebook_outlined),
                            color: Colors.blue,
                            iconSize: 45,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.tiktok),
                            color: Colors.black,
                            iconSize: 45,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.telegram),
                            color: Colors.blue,
                            iconSize: 45,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SignUpScreen();
                            }));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
