import 'package:flutter/material.dart';

class test extends StatefulWidget {
  @override
  _test createState() => _test();
}

class _test extends State<test> {
  bool circle = false;
  double _width = 100; // the width at the beginning
  double _height = 100; // the height at the beginning
  Color _color = Colors.yellow; // the color at the beginning

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: _width,
                height: _height,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: _color),
                curve: Curves.decelerate,
                onEnd: () {
                  setState(() {
                    _width = _width == 100 ? 300 : 100;
                    _height = _height == 100 ? 300 : 100;
                    _color = _color = Colors.yellow;
                  });
                },
              ),
              TextButton(
                child: circle == true ? square() : Circle(),
                onPressed: () {
                  setState(() {
                    _width = 300;
                    _height = 500;
                    _color = Colors.red;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  Widget build(BuildContext context) {
    return (Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.deepPurpleAccent,
      ),
    ));
  }
}

class square extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: (Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
      )),
    );
  }
}
