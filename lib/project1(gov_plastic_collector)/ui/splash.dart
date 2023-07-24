import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';

import 'intro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  await Hive.initFlutter();
  await Hive.openBox("box1");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: true,
    home: splash(),
  ));
}

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => p1(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/animation/87189-bin-trash-dump.json",height: 150,width: 100,
                  fit: BoxFit.fill),
              Text(
                "plastic picker",
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 50,fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
