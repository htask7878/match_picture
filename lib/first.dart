import 'package:flutter/material.dart';

class frist extends StatefulWidget {
  const frist({Key? key}) : super(key: key);

  @override
  State<frist> createState() => _fristState();
}

class _fristState extends State<frist> {
  List imglist = [
    "aguacate.png",
    "baloon.png",
    "banana.png",
    "aguacate.png",
    "baloon.png",
    "banana.png"
  ];
  List visiblelist = List.filled(6, true);
  int t = 1;
  String img1 = "", img2 = "";
  int pos1 = 0, pos2 = 0;

  @override
  void initState() {
    imglist.shuffle();
    Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {
        visiblelist = List.filled(6, false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("photo puzzel"),
      ),
      body: GridView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                if (t == 1) {
                  visiblelist[index] = true;
                  img1 = imglist[index];
                  pos1 = index;
                  t = 2;
                } else if (t == 2) {
                  visiblelist[index] = true;
                  img2 = imglist[index];
                  pos2 = index;
                  if (img1 == img2) {
                    if (!visiblelist.contains(false)) {
                      showDialog(
                        builder: (context) {
                          return AlertDialog(
                            title: Text("you are win"),
                          );
                        },
                        context: context,
                      );
                    }
                  } else {
                    Future.delayed(Duration(milliseconds: 500)).then((value) {
                      setState(() {
                        visiblelist[pos1] = false;
                        visiblelist[pos2] = false;
                      });
                    });
                  }
                  t = 1;
                }
              });
            },
            child: Visibility(
                visible: visiblelist[index],
                replacement: Container(
                  height: 200,
                  width: 200,
                  color: Colors.black,
                ),
                child: Image.asset(
                  "image/${imglist[index]}",
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: imglist.length,
      ),
    );
  }
}
