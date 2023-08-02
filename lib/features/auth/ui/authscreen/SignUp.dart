import 'package:e_commerce/common/bloc/common_state.dart';
import 'package:e_commerce/common/utils/Snackbar_utils.dart';
import 'package:e_commerce/features/auth/cubit/SignUpCubit.dart';
import 'package:e_commerce/features/auth/ui/authscreen/signIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUp_ScreenState createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUpWidget> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return SignUpScreen();
              }),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        elevation: 0,
        // backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<SignUpCubit, CommonState>(
            listener: (context, state) {
              if (state is CommonSuccessState) {
                  SnackBarUtils.ShowMessage(
                    context: context,
                   message: "Sign Up Successfully");
                
                Navigator.of(context).pop();
              } else if (state is CommonErrorState) {
                SnackBarUtils.ShowMessage(
                  context: context, 
                  message: state.message);
              }
            },
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Full Name",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: fullnameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Enter Full Name',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 228, 228, 0.694),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Phone Number",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Enter Phone Number',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 228, 228, 0.694),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: addressController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: const InputDecoration(
                      labelText: 'Enter Address',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 228, 228, 0.694),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Email address",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Enter Email Address',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 228, 228, 0.694),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Enter your Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 228, 228, 0.694),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 4) {
                        return "Password field must be be at least 4 character long";
                      } else
                        return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  const Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Enter Confirm Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 228, 228, 0.694),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value.length < 4) {
                        return "Password field must be at least 4 character long";
                      } else if (value != passwordController.text) {
                        return "Password doesnot matched";
                      } else
                        return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<SignUpCubit>().signUp(
                            fullName: fullnameController.text,
                            phoneNumber: phoneController.text,
                            address: addressController.text,
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
                              'SIGNUP',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook_outlined),
                          color: Colors.blue,
                          iconSize: 45,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.tiktok),
                          color: Colors.black,
                          iconSize: 45,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.telegram),
                          color: Colors.blue,
                          iconSize: 45,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            text: "Already have an account? ",
                          ),
                        ),
                        const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
