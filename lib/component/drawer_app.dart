// import 'package:flutter/material.dart';

// class drawer_app extends StatefulWidget {
//   @override
//   _drawer createState() => _drawer();
// }

// class _drawer extends State<drawer_app> {
//   List list = [Colors.grey, Colors.blue];

//   Widget build(BuildContext context) {
//     return (Scaffold(
//         appBar: AppBar(title: Text("drawer")),
//         body: const Center(
//           child: Text("app"),
//         ),
//         drawer: Drawer(
//             child: ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (BuildContext context, int index) {
//                   return (Card(
//                     child:
//                         Container(height: 40, color: list[index % list.length]),
//                   ));
//                 }))));
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_app/Screen/filter/filter_screen.dart';
import 'package:my_app/Screen/homePage.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class NavigationDrawer extends StatefulWidget {
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  int _selectionIndex = 0;
  final drawerItems = [
    DrawerItem("First Screen", Icons.looks_one),
    DrawerItem("Second Screen", Icons.looks_two),
    DrawerItem("Tabs", Icons.tab),
  ];

  _getDrawerItemScreen(int pos) {
    switch (pos) {
      case 1:
        return FilterPage();
      case 2:
        return homePage();
      default:
        return NavigationDrawer();
    }
  }

  _onSelectItem(int index) {
    setState(() {
      _selectionIndex = index;
      _getDrawerItemScreen(_selectionIndex);
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _getDrawerItemScreen(_selectionIndex),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(
          d.title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        selected: i == _selectionIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Akshay Kadam (A2K)'),
              accountEmail: Text('a2k@gmail.com'),
            ),
            Column(
              children: drawerOptions,
            ),
          ],
        ),
      ),
      body: homePage(),
    );
  }
}
