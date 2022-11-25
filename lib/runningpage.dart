import 'package:flutter/material.dart';
import 'package:match_picture/model.dart';

class runningpage extends StatefulWidget {
  const runningpage({Key? key}) : super(key: key);

  @override
  State<runningpage> createState() => _runningpageState();
}

class _runningpageState extends State<runningpage> {
  List pl = [
    "aguacate.png",
    "baloon.png",
    "banana.png",
    "bell.png",
    "bellota.png",
    "boat.png",
    "aguacate.png",
    "baloon.png",
    "banana.png",
    "bell.png",
    "bellota.png",
    "boat.png",
  ];
  List visibilitylist = List.filled(12, true);
  int t = 1;
  int pos1 = 0;
  int pos2 = 0;
  String photo1 = "", photo2 = "";

  @override
  void initState() {
    super.initState();
    pl.shuffle();
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        setState(() {
          visibilitylist = List.filled(12, false);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: model.green,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.volume_up))],
        title: Text("Time", style: TextStyle(fontWeight: FontWeight.w400)),
      ),
      backgroundColor: model.back_color,
      body: GridView.builder(
        itemCount: pl.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Colors.deepOrange,
            onTap: () {
              setState(() {
                if (t == 1) {
                  print("first");
                  visibilitylist[index] = true;
                  photo1 = pl[index];
                  pos1 = index;
                  t = 2;
                } else if (t == 2) {
                  print("second");
                  visibilitylist[index] = true;
                  photo2 = pl[index];
                  pos2 = index;
                  if (photo1 == photo2) {
                    print("match");
                    if (!visibilitylist.contains(false)) {
                      print("winner");
                      showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              title: Text("You are win"),
                            );
                          });
                    }
                  } else {
                    Future.delayed(Duration(milliseconds: 500)).then((value) {
                      setState(() {
                        visibilitylist[pos1] = false;
                        visibilitylist[pos2] = false;
                        print("no match");
                      });
                    });
                  }
                  t = 1;
                }
              });
            },
            child: Visibility(
              visible: visibilitylist[index],
              child: Image.asset(
                "image/${pl[index]}",
                height: 100,
                width: 100,
              ),
              replacement: Container(
                color: model.green,
                height: 100,
                width: 100,
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2),
      ),
    );
  }
}
