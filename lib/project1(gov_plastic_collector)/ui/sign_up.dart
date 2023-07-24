
import 'package:final_project/project1(gov_plastic_collector)/ui/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../authintication/helper/helper_class.dart';
import 'Users.dart';


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController sigup_usr =TextEditingController();
  TextEditingController sigup_psd =TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: AssetImage("assets/images/img.png"))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 240, top: 30),
                    child: Text("Signup to\nGet Started",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan[900])),
                  ),
                  SizedBox(height: 50),

                  ///text field 1 in container
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(width: (MediaQuery
                        .of(context)
                        .size
                        .width / 1.33),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: TextFormField(controller: sigup_usr,
                          style: TextField.materialMisspelledTextStyle,
                          decoration: InputDecoration(
                              hintText: "Email",
                              border: InputBorder.none),),),),),
                  SizedBox(height: 10),

                  ///textfield 2 in container
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(width: (MediaQuery
                        .of(context)
                        .size
                        .width / 1.33),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: TextField(controller:sigup_psd,
                          obscureText: show,
                          style: TextField.materialMisspelledTextStyle,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (show) {
                                        show = false;
                                      } else {
                                        show = true;
                                      }
                                    });
                                  },
                                  icon: Icon(show == true
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              hintText: "Password",
                              border: InputBorder.none),),),),),

                  SizedBox(height: 40,),

                  ///sign up button
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.cyan[900]),
                          minimumSize: MaterialStatePropertyAll(Size(
                              (MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.5),
                              (MediaQuery
                                  .of(context)
                                  .size
                                  .height / 14.5))),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)))),
                      onPressed: ()
                      {
                        String sname = sigup_usr.text.trim();
                        String spas =  sigup_psd.text.trim();
                        helper().SignUP(email: sname, password: spas).then((value)
                        {
                          if(value==null)
                            {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => signin(),));
                            }
                          else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error is ${value}")));
                            }
                        });
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 18),
                      )),

                  ///text and textbutton
                  Padding(
                    padding: const EdgeInsets.only(top: 2, left: 100),
                    child: Row(
                      children: [
                        Text("Already have an account",
                            style: TextStyle(color: Colors.grey)),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => signin(),));
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyan[900]),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signInWithGoogle() async
  {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(
        credential);
    print(userCredential.user?.displayName);
    if (userCredential.user != null) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => home(),));
    }
  }
}
