import 'dart:ui';

import 'package:flutter/material.dart';

class homee extends StatefulWidget {
  @override
  _home createState() => _home();
}

class _home extends State<homee> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Container(
          //   height: 250,
          //   width: 400,
          //   child: Card(
          //     semanticContainer: true,
          //     clipBehavior: Clip.antiAliasWithSaveLayer,
          //     child:
          //         Image.asset("assets/aanch_logo.png", width: 300, height: 100),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //     elevation: 5,
          //     margin: EdgeInsets.all(10),
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/aanch_logo.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 12, bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("aanch restaurent",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xfffa892a)),
                                onPressed: () {},
                                child: Text("View"))
                          ],
                        )),
                    Text(
                        "Ipsum has been the industry's standard dummy text ever since the 1500s",
                        style: TextStyle(fontSize: 18.0))
                    //Image.asset("assets/aanch_logo.png"),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
            height: 310,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/cc_logo.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("chatpata chowk",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xfffa892a)),
                                onPressed: () {},
                                child: Text(
                                  "View",
                                  style: TextStyle(fontSize: 20),
                                ))
                          ],
                        )),
                    Text(
                        "Ipsum has been the industry's standard dummy text ever since the 1500s",
                        style: TextStyle(fontSize: 18.0))
                    //Image.asset("assets/aanch_logo.png"),
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}
