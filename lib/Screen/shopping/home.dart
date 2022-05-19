// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  _home createState() => _home();
}

class _home extends State<homepage> {
  List<String> litems = ["pizza", "puri", "sabji", "halwa"];

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return (Scaffold(
      // ignore: unnecessary_new
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: height * 0.05),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Column(
                        children: [
                          Column(
                            children: [
                              Text("abcc"),
                            ],
                          ),
                          Text("dvdnvdkvbk")
                        ],
                      )),
                      Text('bdjkhk')
                    ],
                  ),
                ),
              ),
              Divider(
                height: 20.0,
                thickness: 2.0,
              ),
              Container(
                height: height * .18,
                // ignore: unnecessary_new
                child: new ListView.builder(
                    itemCount: litems.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctxt, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'assets/foodone.png',
                                width: 80.0,
                                height: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              litems[index],
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              Container(
                height: height * .18,
                // ignore: unnecessary_new
                child: new ListView.builder(
                    itemCount: litems.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctxt, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'assets/foodone.png',
                                width: 80.0,
                                height: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              litems[index],
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              Container(
                height: height * .1,
                // ignore: unnecessary_new
                child: new ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: litems.length,
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctxt, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: 30, right: 0, top: 0, bottom: 0),
                        width: 300,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(16.0),
                          color: Colors.black87,
                        ),
                      );
                    }),
              ),
              Container(
                height: height * .2,
                // ignore: unnecessary_new
                child: new ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: litems.length,
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctxt, index) {
                      return Container(
                          margin: EdgeInsets.only(
                              left: 30, right: 0, top: 0, bottom: 0),
                          width: 150,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(16.0),
                            color: Colors.white,

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            //color: Colors.orange,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'assets/foodtwo.jpg',
                              width: .0,
                              height: 100.0,
                              fit: BoxFit.fill,
                            ),
                          ));
                    }),
              ),
              Container(
                height: 220,
                // ignore: unnecessary_new
                child: new ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: litems.length,
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctxt, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: 30, right: 0, top: 0, bottom: 0),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(16.0),
                          color: Colors.white,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          //color: Colors.orange,
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              child: Image(
                                image: AssetImage(
                                  'assets/foodtwo.jpg',
                                ),
                                width: 200,
                                height: 170.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text("data"),
                                Text("data"),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    ));
  }

//   Widget Scrollv(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(
//               left: 30,
//               right: 30,
//             ),
//             child: SizedBox(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                       child: Column(
//                     children: [
//                       Column(
//                         children: [
//                           Text("abcc"),
//                         ],
//                       ),
//                       Text("dvdnvdkvbk")
//                     ],
//                   )),
//                   Text('bdjkhk')
//                 ],
//               ),
//             ),
//           ),
//           Divider(
//             height: 20.0,
//             thickness: 2.0,
//           ),
//           Container(
//             height: 1,
//             // ignore: unnecessary_new
//             child: new ListView.builder(
//                 itemCount: litems.length,
//                 scrollDirection: Axis.horizontal,
//                 padding: EdgeInsets.zero,
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (ctxt, index) {
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 10, right: 10),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(50.0),
//                           child: Image.asset(
//                             'assets/foodone.png',
//                             width: 100.0,
//                             height: 100.0,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Center(
//                         child: Text(
//                           litems[index],
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//           ),
//           Expanded(
//             height: 1,
//             // ignore: unnecessary_new
//             child: new ListView.builder(
//                 itemCount: litems.length,
//                 scrollDirection: Axis.horizontal,
//                 padding: EdgeInsets.zero,
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (ctxt, index) {
//                   return Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 10, right: 10),
//                         height: 100,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           border: Border.all(
//                             color: Colors.black,
//                             width: 1,
//                           ),
//                         ),
//                       ),
//                       Center(
//                         child: Text(litems[index]),
//                       ),
//                     ],
//                   );
//                 }),
//           ),
//           Expanded(
//             height: 1,
//             // ignore: unnecessary_new
//             child: new ListView.builder(
//                 itemCount: litems.length,
//                 scrollDirection: Axis.horizontal,
//                 padding: EdgeInsets.zero,
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (ctxt, index) {
//                   return Container(
//                     padding: EdgeInsets.zero,
//                     // height: 5,
//                     margin: EdgeInsets.only(
//                       left: 30,
//                       right: 30,
//                     ),
//                     width: 250,
//                     decoration: BoxDecoration(
//                       borderRadius: new BorderRadius.circular(16.0),
//                       color: Colors.orange,
//                     ),
//                   );
//                 }),
//           ),
//           Expanded(
//             height: 1,
//             // ignore: unnecessary_new
//             child: new ListView.builder(
//                 padding: const EdgeInsets.all(8.0),
//                 itemCount: litems.length,
//                 scrollDirection: Axis.horizontal,
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (ctxt, index) {
//                   return Container(
//                     margin:
//                         EdgeInsets.only(left: 30, right: 0, top: 0, bottom: 0),
//                     width: 100,
//                     height: 10,
//                     decoration: BoxDecoration(
//                       borderRadius: new BorderRadius.circular(16.0),
//                       color: Colors.orange,
//                     ),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
}
