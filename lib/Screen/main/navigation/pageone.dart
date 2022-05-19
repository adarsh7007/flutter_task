import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_app/Screen/main/navigation/navigation.dart';

class pageone extends StatefulWidget {
  pageone({Key? key}) : super(key: key);

  @override
  _page createState() => _page();
}

class _page extends State<pageone> {
  int counter = 0;

  void _increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('Secondpage'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => navigation(
                count: counter,
              ),
            ),
          ),
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => navigation(count : counter))),
        ),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            new FloatingActionButton(
              onPressed: _increment,
              child: new Text('Increment'),
            ),
            new Text('Count: ${counter}'),
          ],
        ),
      ),
    ));

    // new Row(
    //   children: <Widget>[
    //     new RaisedButton(
    //       onPressed: _increment,
    //       child: new Text('Increment'),
    //     ),
    //     new Text('Count: ${widget._counter}'),
    //   ],
    // );
  }
}
