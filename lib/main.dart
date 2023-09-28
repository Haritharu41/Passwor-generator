import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Pass Generator",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Pass Generator"),
      ),
      body: Myappbody(),
    ),
  ));
}

class Myappbody extends StatefulWidget {
  const Myappbody({
    super.key,
  });

  @override
  State<Myappbody> createState() => _MyappbodyState();
}

class _MyappbodyState extends State<Myappbody> {
  TextEditingController c = TextEditingController();
  String randomPassword = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Enter no length",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: c,
          ),
          Text(
            "Random Pssword is $randomPassword",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          MaterialButton(
              child: Text(
                "Generate",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (c.text.isNotEmpty) {
                  String randomPass =
                      randomPassGenerator(length: int.parse(c.text));
                  setState(() {
                    randomPassword = randomPass;
                  });
                }
              })
        ],
      ),
    );
  }
} // Create Random Password Generator Using [4 Min]

String randomPassGenerator({int? length}) {
  var alhpabets = ['a', 'b', 'c', 'd', 'e', 'f'];
  var alphabetsC = ['A', 'B', 'C', 'D', 'E', 'F'];
  var neumeric = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  var symbols = ['_', '#', '%', '\$', ','];
  String randomPassword = "";
  var allitems = [...alhpabets, ...alphabetsC, ...neumeric, ...symbols];
  allitems.shuffle();

  for (int i = 0; i < length!; i++) {
    if (length > allitems.length) {
      break;
    }
    randomPassword += allitems[i].toString();
  }
  return randomPassword;
}
