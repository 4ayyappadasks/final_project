import 'package:final_project/project1(gov_plastic_collector)/ui/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:list_picker/list_picker.dart';
import 'package:lottie/lottie.dart';


class hivep1 extends StatefulWidget {
  const hivep1({Key? key}) : super(key: key);

  @override
  State<hivep1> createState() => _hivep1State();
}

class _hivep1State extends State<hivep1> {
  @override
  void initState() {
    refresh();
    super.initState();
  }

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController paid = TextEditingController();

  final hive_st = Hive.box("box1");
  List<Map<String, dynamic>> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.cyan[900],
        onPressed: () {
          showsheet(null);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(actions: [PopupMenuButton(itemBuilder: (context) {
        return [PopupMenuItem(child: TextButton(onPressed: ()
        {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => signin(),));
          Get.snackbar("logout", "admin logged out");
        }
            , child: Text("logout")))];
      },)],
          bottom: PreferredSize(child: Container(), preferredSize: Size.fromHeight(50)),
          backgroundColor: Colors.cyan[900],
          title: Center(
            child: IconButton(
                onPressed: () {
                  refresh();
                },
                icon: Icon(Icons.refresh)),
          )),
      body: SafeArea(
          child: Center(
        child: data.isEmpty
            ? Lottie.asset("assets/animation/105146-greenify-the-earth.json",
                width: 200, height: 200)
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Text(data[index]["name"]),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 250),
                        child: Text("name: ${data[index]["name"]}"),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(right: 230),
                        child: Text("contact no: ${data[index]["number"]}"),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(right: 230),
                        child: Text("address: ${data[index]["details"]}"),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(right: 200),
                        child: Text("amount paid: ${data[index]["details"]}"),
                      ),

                      IconButton(
                          onPressed: () {
                            showsheet(data[index]["id"]);
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            deletes(data[index]["id"]);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  );
                },
              ),
      )),
    );
  }

  void showsheet(int? id) {
    if (id != null) {
      final uptdata = data.firstWhere((element) => element["id"] == id);
      name.text = uptdata["name"];
      number.text = uptdata["number"];
      details.text = uptdata["details"];
      paid.text = uptdata["paid"];
    }

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        ListPickerField paids;
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                  maxLength: 15,
                  controller: name,
                  decoration: InputDecoration(hintText: "name")),
              TextField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: number,
                  decoration: InputDecoration(hintText: "number")),
              SizedBox(
                height: 30,
              ),
              TextField(
                  maxLength: 15,
                  controller: details,
                  decoration: InputDecoration(hintText: "details")),
              SizedBox(
                height: 30,
              ),
              paids =
                  ListPickerField(width:( MediaQuery.of(context).size.width)/2,
                    label: "paid 50 rs",
                    items: ["Yes","No"],),
              SizedBox(
              height: 30,),
              ElevatedButton(
                  style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(300, 50)),
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.cyan[900])),
                  onPressed: () async {
                    id == null
                        ? Create({
                            "name": name.text.trim(),
                            "number": number.text.trim(),
                      "details":details.text.trim()
                          })
                        : Update(id, {
                          "name": name.text,
                      "number": number.text,
                      "details":details.text
                        });
                  },
                  child: id == null ? Text("create") : Text("update"))
            ]),
          ),
        );
      },
    );
  }

  Future<void> Create(Map<String, dynamic> crt) async {
    await hive_st.add(crt);
    name.text = "";
    number.text = "";
    details.text = "";
    Navigator.of(context).pop();
    refresh();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Lottie.asset("assets/animation/59865-confirmation-tick.json")));
  }

  Future<void> Update(ids, Map<String, dynamic> upt) async {
    await hive_st.put(ids, upt);
    name.text = "";
    number.text = "";
    details.text = "";
    Navigator.of(context).pop();
    refresh();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Lottie.asset("assets/animation/98109-updating-animation.json")));
  }

  Future<void> deletes(dlt) async {
    await hive_st.delete(dlt);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Lottie.asset("assets/animation/87669-delete-animation.json")));
    refresh();
  }

  Future<void> refresh() async {
    final stg = hive_st.keys.map((e) {
      final stg1 = hive_st.get(e);
      return {"id": e, "name": stg1["name"], "number": stg1["number"],"details":stg1["details"]};
    }).toList();

    setState(() {
      data = stg.reversed.toList();
    });
  }
}

