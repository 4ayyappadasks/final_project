import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Login.dart';
import 'Registration.dart';

class log_reg extends StatelessWidget {

  const log_reg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Container(

          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Lottie.asset("assets/animation/105146-greenify-the-earth.json",height: 200,width: 200),
            SizedBox(height: 20,),
            TextButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => login(),));
            }, child: Text("login")),
            SizedBox(height: 30,),
            TextButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>signup()));},
                child: Text("registration"))
          ]),


        )),
      ),
    );
  }
}
