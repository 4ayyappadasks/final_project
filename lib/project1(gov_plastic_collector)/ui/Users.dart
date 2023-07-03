import 'package:final_project/project1(gov_plastic_collector)/ui/call.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  // final List<Map<String, dynamic>> data = [
  //   {
  //     'title': '1111',
  //     'backgroundColor': Colors.grey,
  //   },
  //   {
  //     'title': '2222',
  //     'backgroundColor': Colors.red,
  //   },
  //   {
  //     'title': '3333',
  //     'backgroundColor': Colors.yellow,
  //   },
  //   {
  //     'title': '4444',
  //     'backgroundColor': Colors.blue,
  //   },
  //   {
  //     'title': '5555',
  //     'backgroundColor': Colors.green,
  //   },
  //   {
  //     'title': '6666',
  //     'backgroundColor': Colors.orange,
  //   },
  //   {
  //     'title': '7777',
  //     'backgroundColor': Colors.brown,
  //   },
  //   {
  //     'title': '8888',
  //     'backgroundColor': Colors.purple,
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text("Plastic filled"),
          ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => call(),));
          }, child: Text("submit")),

        ]),
      ),
    );
  }
}
