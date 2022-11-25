import 'package:flutter/material.dart';
import 'package:match_picture/model.dart';

class levellist extends StatefulWidget {
  const levellist({Key? key}) : super(key: key);

  @override
  State<levellist> createState() => _levellistState();
}

class _levellistState extends State<levellist> {

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
      bottomNavigationBar: ColoredBox(
          color: model.green,
          child: SizedBox(
            height: 40,
          )),
      body: Center(
        child: Container(
          height: 400,
          width: 220,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(color: model.green, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 30,
                width: 100,
                margin: EdgeInsets.all(10),
                color: Colors.yellow,
              );
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
