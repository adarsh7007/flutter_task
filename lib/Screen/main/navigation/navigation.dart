import 'package:flutter/material.dart';
import 'package:my_app/Screen/main/navigation/pageone.dart';

class navigation extends StatefulWidget {
  var count;
  navigation({
    Key? key,
    this.count,
  }) : super(key: key);

  _nav createState() => _nav();
}

class _nav extends State<navigation> {
  void initState() {
    print(widget.count);

    if (widget.count == null) {
      widget.count = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          children: [
            new Text('Count:' + widget.count.toString()),
            RaisedButton(
              child: Text(
                'Navigate to a new screen >>',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                _navigateToNextScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => pageone()));
  }
}
