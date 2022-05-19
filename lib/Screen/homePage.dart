// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/Screen/filter/filter_screen.dart';

class homePage extends StatefulWidget {
  @override
  _home createState() => _home();
}

class _home extends State<homePage> {
  @override
  final double topWidgetHeight = 200.0;
  final double avatarRadius = 50.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height / 1,
          child: new Stack(
            children: <Widget>[
              Positioned(
                top: 150,
                left: 20,
                right: 20,
                child: new Container(
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)),
                    // padding: const EdgeInsets.fromLTRB(10, 55, 10, 0),
                    height: 200,
                    width: 300,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 70, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "hajdhjkahd",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.blue),
                            ),
                            Text("nfksjfkskfjkas")
                          ],
                        ))),
              ),
              new Positioned(
                child: new CircleAvatar(
                  radius: avatarRadius,
                  backgroundColor: Colors.green,
                ),
                left: 150,
                right: 150,
                top: 100,
              ),
              new Positioned(
                child: new CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.lightBlue,
                ),
                left: 60,
                right: 0,
                top: 160,
              )
            ],
          ),
        ),
      ),
    );
  }
}
