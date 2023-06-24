import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Holidays extends StatefulWidget {
  const Holidays({Key? key}) : super(key: key);

  @override
  State<Holidays> createState() => _HolidaysState();
}

class _HolidaysState extends State<Holidays> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          child: Scaffold(
        appBar: AppBar(
          title: Text("Holidays"),
        ),
        body: Column(
          children: [
            ListTile(
              tileColor: Colors.red,
              title: Text("New Year - Holiday"),
            )
          ],
        ),
      )),
    );
  }
}
