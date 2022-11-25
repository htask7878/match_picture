 import 'package:flutter/material.dart';
import 'package:match_picture/model.dart';

import 'runningpage.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: model.green,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.volume_up))],
        title:
            Text("Select mode", style: TextStyle(fontWeight: FontWeight.w400)),
      ),
      backgroundColor: model.back_color,
      body: Center(
        child: Container(
          height: 250,
          width: 220,
          decoration: BoxDecoration(
              // color: Colors.orange,
              border: Border.all(color: model.green, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize:Size(170,50),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0,
                              style: BorderStyle.solid, color: model.green)),
                      onPrimary: model.back_color,
                      primary: model.green),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return runningpage();
                    },));
                  },
                  child: Text(
                    "no time limit".toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 17),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     fixedSize:Size(170,50),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0,
                              style: BorderStyle.solid, color: model.green)),
                      onPrimary: model.back_color,
                      primary: model.green),
                  onPressed: () {},
                  child: Text(
                    "normal".toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 17),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize:Size(170,50),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0,
                              style: BorderStyle.solid, color: model.green)),
                      onPrimary: model.back_color,
                      primary: model.green),
                  onPressed: () {},
                  child: Text(
                    "hard".toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 17),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
