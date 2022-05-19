import 'package:flutter/material.dart';

class bottom {
  static void bottommodel(context) {
    Size size = MediaQuery.of(context).size;

    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
                height: size.height * .4,
                margin: EdgeInsets.only(top: 20),
                child: Wrap(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a search term'),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a search term'),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a search term'),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a search term'),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a search term'),
                    ),
                  ],
                )));
      },
    );
  }
}

class bottomsheet extends StatelessWidget {
  Widget build(BuildContext context) {
    return (Container(
      child: ElevatedButton(
        onPressed: () => bottom.bottommodel(context),
        child: null,
      ),
    ));
  }
}
