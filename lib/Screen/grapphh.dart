import 'package:flutter/material.dart';

class graphh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: ItemsScene(),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}

class ItemsScene extends StatefulWidget {
  @override
  _ItemsSceneState createState() => _ItemsSceneState();
}

class _ItemsSceneState extends State<ItemsScene> {
  List<ItemModel> items = [
    ItemModel(offset: Offset(200, 100), text: 'text1'),
    ItemModel(offset: Offset(120, 150), text: 'text22'),
    ItemModel(offset: Offset(60, 200), text: 'text333'),
    ItemModel(offset: Offset(40, 250), text: 'text4444'),
    ItemModel(offset: Offset(50, 300), text: 'text55555'),
    ItemModel(offset: Offset(100, 200), text: 'text6666'),
    ItemModel(offset: Offset(70, 400), text: 'text7'),
    ItemModel(offset: Offset(80, 450), text: 'text8'),
  ];

  Function onDragStart(int index) => (x, y) {
        setState(() {
          items[index] = items[index].copyWithNewOffset(Offset(x, y));
        });
      };

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomPaint(
          size: Size(double.infinity, double.infinity),
          painter: CurvedPainter(
            offsets: items.map((item) => item.offset).toList(),
          ),
        ),
        ..._buildItems()
      ],
    );
  }

  List<Widget> _buildItems() {
    final res = <Widget>[];
    items.asMap().forEach((ind, item) {
      res.add(_Item(
        onDragStart: onDragStart(ind),
        offset: item.offset,
        text: item.text,
      ));
    });

    return res;
  }
}

class _Item extends StatelessWidget {
  _Item({
    Key? key,
    required this.offset,
    required this.onDragStart,
    required this.text,
  });

  final double size = 100;
  final Offset offset;
  final Function onDragStart;
  final String text;

  _handleDrag(details) {
    print(details);
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    onDragStart(x, y);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx - size / 2,
      top: offset.dy - size / 2,
      child: GestureDetector(
        onPanStart: _handleDrag,
        onPanUpdate: _handleDrag,
        child: Container(
          width: size,
          height: size,
          child: Text(text),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  CurvedPainter({required this.offsets});

  final List<Offset> offsets;

  @override
  void paint(Canvas canvas, Size size) {
    if (offsets.length > 1) {
      offsets.asMap().forEach((index, offset) {
        if (index == 0) return;
        canvas.drawLine(
          offsets[index - 1],
          offsets[index],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 2,
        );
      });
    }
  }

  @override
  bool shouldRepaint(CurvedPainter oldDelegate) => true;
}

class ItemModel {
  ItemModel({required this.offset, required this.text});

  final Offset offset;
  final String text;

  ItemModel copyWithNewOffset(Offset offset) {
    return ItemModel(offset: offset, text: text);
  }
}
