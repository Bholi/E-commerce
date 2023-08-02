// // import 'package:e_commerce/common/bloc/common_state.dart';
// import 'package:e_commerce/features/auth/ui/screen/SignIn.dart';
// // import 'package:e_commerce/features/auth/ui/splash/cubit/startup_cubit.dart';
// import 'package:flutter/material.dart';

// class Screen_View extends StatefulWidget {
//   // const Screen_View(SignIn_Screen signIn_Screen, {super.key});

//   @override
//   State<Screen_View> createState() => _Screen_ViewState();
// }

// class _Screen_ViewState extends State<Screen_View> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//           margin: EdgeInsets.only(bottom: 50),
//           color: Colors.white,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context)
//                         .push(MaterialPageRoute(builder: (context) {
//                       return SignIn_Screen();
//                     }));
//                   },
//                   child: Image.network(
//                     "https://freevector-images.s3.amazonaws.com/uploads/vector/preview/36682/36682.png",
//                     height: 300,
//                     width: 300,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
      
//     );
//   }
// }
