import 'package:flutter/material.dart';

import 'food.dart';

class Foodlist extends StatelessWidget {
  final List<Food> foods;

  const Foodlist({Key? key, required this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (foods.isEmpty) {
      return const Center(
          child: Text(
        'No product',
        style: TextStyle(fontSize: 16),
      ));
    }

    return Scaffold(
      body: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (_, index) {
            final currentPhone = foods[index];
            return Container(
              width: 10,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 186, 215, 255),
                border: Border.all(
                  color: Color.fromARGB(255, 13, 119, 240),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              //color: Colors.grey,
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 10,
              ),
              child: ListTile(
                  title: Text(currentPhone.name),
                  subtitle: Text('${currentPhone.foodType}'),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(' rs'),
                        Text(' ${currentPhone.price}'),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
