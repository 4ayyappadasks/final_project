import 'package:final_project/project1(gov_plastic_collector)/ui/sign_in.dart';
import 'package:final_project/project1(gov_plastic_collector)/ui/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class log_reg extends StatelessWidget {

  const log_reg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage(
                    "assets/images/93155.jpg"))),

        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Lottie.asset("assets/animation/105146-greenify-the-earth.json",height: 200,width: 200),
          SizedBox(height: 20,),
          TextButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => signin(),));
          }, child: Text("login")),
          SizedBox(height: 30,),
          TextButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>signup()));},
              child: Text("registration"))
        ]),


      )),
    );
  }
}
