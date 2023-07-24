import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/project1(gov_plastic_collector)/ui/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:list_picker/list_picker.dart';
import 'package:lottie/lottie.dart';

import '../authintication/helper/helper_class.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    ListPickerField picked_data;
    ListPickerField paid;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CarouselSlider(items: 
              [
                Image.network("https://images.unsplash.com/photo-1611284446314-60a58ac0deb9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
                Image.network("https://images.unsplash.com/photo-1604187351574-c75ca79f5807?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
                Image.network("https://images.unsplash.com/photo-1618477461853-cf6ed80faba5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
              ],
                  options: CarouselOptions(autoPlay: true,enlargeCenterPage: true)),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                picked_data =
                    ListPickerField(width:( MediaQuery.of(context).size.width)/2,
                      label: "Plastic filled",
                      items: ["Yes","No"],),

                  paid =
                      ListPickerField(width:( MediaQuery.of(context).size.width)/2,
                        label: "paid 50 rs",
                        items: ["Yes","No"],),
              ],),
          ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan[900])),
              onPressed: () {
            bool n = true;
            detail(n,picked_data);
          }, child: Text("submit")),

              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.cyan[900])),
                  onPressed: () {
                    logout();
                  },
                  child: Text("logout"))

        ]),
      ),
    );
  }

  void logout() {
    helper().SignOut().then((value) {
      Get.snackbar("log out", "sucessfuly done",backgroundColor: Colors.greenAccent);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => signin(),
      ));
    });
  }

   void detail(bool n, ListPickerField picked_data)
  {
    if(n==true)
      {
            Get.snackbar("sucess", "sucessfuly added to admin list",backgroundColor: Colors.greenAccent);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(backgroundColor: Colors.white,
                    content: Lottie.asset("assets/animation/84858-wrx-success.json")));
      }
  }
}
