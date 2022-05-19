import 'package:flutter/material.dart';
import 'package:my_app/Screen/shopping/home.dart';

class Nave extends StatefulWidget {
  _nav createState() => _nav();
}

class _nav extends State<Nave> {
  int i = 0;
  var pages = [
    new homepage(),
    new homepage(),
    new homepage(),
    new homepage(),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {},
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 104, 104, 29)),
              child: Icon(Icons.add, size: 40),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[i],
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.photo_library),
            label: 'Blog',
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            label: 'Library',
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: i,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            i = index;
          });
        },
      ),
    );
  }
}
