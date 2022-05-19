import 'dart:ui';

import 'package:flutter/material.dart';

class foodpage extends StatefulWidget {
  _food createState() => _food();
}

class _food extends State<foodpage> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30),
            height: 200,
            width: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Color(0xfffcba32),
                    Color(0xff050505),
                    // Color(0xff3c3b38),
                    Color(0xfffa892a)
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/foodtwo.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(30)),
                ),
                child: ClipRRect(
                  // make sure we apply clip it properly
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.grey.withOpacity(0.5),
                          child: Image.asset('assets/cc_logo.png'))),
                ),
                // child: new Image.asset(
                //   'assets/foodone.png',
                //   height: 60.0,
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff797e21), Color(0xffc4c730)],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/foodone.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(30)),
                ),
                child: ClipRRect(
                  // make sure we apply clip it properly
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.grey.withOpacity(0.5),
                          child: Image.asset('assets/aanch_logo.png'))),
                ),
                // child: new Image.asset(
                //   'assets/foodone.png',
                //   height: 60.0,
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
