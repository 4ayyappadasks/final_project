import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';

import 'intro.dart';

void main()
async{
  await Hive.initFlutter();
  await Hive.openBox("box1");
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: splash(),));
}
class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => p1(),));});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Container(
        child: Lottie.asset("assets/animation/87189-bin-trash-dump.json",fit: BoxFit.fill),
      )),
    ),);
  }
}
