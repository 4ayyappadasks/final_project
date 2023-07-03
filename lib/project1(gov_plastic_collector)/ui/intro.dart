import 'package:final_project/project1(gov_plastic_collector)/ui/sel_login_reg.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';


class p1 extends StatefulWidget {
  const p1({Key? key}) : super(key: key);

  @override
  State<p1> createState() => _p1State();
}

class _p1State extends State<p1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IntroSlider(
        navigationBarConfig: NavigationBarConfig(
            navPosition: NavPosition.bottom,
            backgroundColor: Colors.white),
            isLoopAutoScroll: true,
            isScrollable: true,
            isAutoScroll: true,
            listCustomTabs: [
              Container(color: Colors.blue,),
              Container(color: Colors.red,),
              Container(color: Colors.indigo,)
            ],
            onDonePress: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => log_reg(),));
            },
      )),
    );
  }
}
