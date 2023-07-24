// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:lottie/lottie.dart';
//
// import 'Users.dart';
// import 'Login.dart';
//
// class signup extends StatefulWidget {
//   const signup({Key? key}) : super(key: key);
//
//   @override
//   State<signup> createState() => _signupState();
// }
//
// class _signupState extends State<signup> {
//
//   var show = true;
//   var showu = true;
//   var formkey = GlobalKey<FormState>();
//
//   ///key
//
//   var name = "appu@";
//   var psd = "123456";
//
//   TextEditingController username =TextEditingController();
//   TextEditingController passworde = TextEditingController();
//   TextEditingController cpassworde = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.green[800],
//           title: Padding(
//             padding: const EdgeInsets.only(left: 70),
//             child: Text("SIGN UP"),
//
//           )),
//       body: Form(
//         key: formkey,
//
//         ///key
//
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//
//                 Lottie.asset("assets/animation/105146-greenify-the-earth.json",height: 200,width: 200),
//
//
//                 /// username
//
//                 TextFormField(
//                   controller: username,
//                   validator: (uname) {
//                     if (uname!.isEmpty || !uname.contains('@')) {
//                       return "user name cant be empty or should contain @";
//                     } else {
//                       return null;
//                     }
//                   },
//                   obscureText: showu,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       prefixIcon: Icon(Icons.account_circle),
//                       suffixIcon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               if (showu) {
//                                 showu = false;
//                               } else {
//                                 showu = true;
//                               }
//                             });
//                           },
//                           icon: Icon(showu == true
//                               ? Icons.visibility_off
//                               : Icons.visibility)),
//
//                       // const Icon(Icons.account_circle_outlined),
//                       hintText: "username or email"),
//                 ),
//
//
//
//                 ///password
//
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: TextFormField(
//                     controller: passworde,
//                     validator: (pasword) {
//                       if (pasword!.isEmpty || pasword.length < 6) {
//                         return "password should not be empty and sholud be above 6 chara";
//                       } else {
//                         return null;
//                       }
//                     },
//                     obscureText: show,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         prefixIcon: Icon(Icons.add_box_sharp),
//                         hintText: "password",
//                         suffixIcon: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 if (show) {
//                                   show = false;
//                                 } else {
//                                   show = true;
//                                 }
//                               });
//                             },
//                             icon: Icon(show == true
//                                 ? Icons.visibility_off
//                                 : Icons.visibility))),
//                   ),
//                 ),
//
//
//                 ///confirm password
//
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: TextFormField(
//                     controller: passworde,
//                     validator: (pasword) {
//                       if (pasword!.isEmpty || pasword.length < 6) {
//                         return "password should not be empty and sholud be above 6 chara";
//                       } else {
//                         return null;
//                       }
//                     },
//                     obscureText: show,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         prefixIcon: Icon(Icons.add_box_sharp),
//                         hintText: "confirm password",
//                         suffixIcon: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 if (show) {
//                                   show = false;
//                                 } else {
//                                   show = true;
//                                 }
//                               });
//                             },
//                             icon: Icon(show == true
//                                 ? Icons.visibility_off
//                                 : Icons.visibility))),
//                   ),
//                 ),
//
//                 ///elevated button
//
//                 ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
//                     onPressed: () {
//                       String email = username.text.trim();
//                       String pas1   = passworde.text.trim();
//
//                       final valid = formkey.currentState!.validate();
//                       if (valid)
//                       {
//                         if(name==email &&   psd==pas1)
//                         {
//                           Navigator.of(context).push(
//                               MaterialPageRoute(builder: (context) => home()));
//                         }
//                       }
//                       else
//                       {
//                         Fluttertoast.showToast(
//                             msg: "sign up failed",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.BOTTOM,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.cyan,
//                             textColor: Colors.white,
//                             fontSize: 16.0);
//                       }
//
//                       ///
//                     },
//                     child: Text("signup")),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => login(),
//                       ));
//                     },
//                     child: Text("login",style: TextStyle(color: Colors.green[700])))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
