import 'package:flutter/material.dart';
import 'filter_check.dart';
import 'food.dart';
import 'food_list.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _MainPageState();
}

class _MainPageState extends State<FilterPage> {
  List<Food> filteredFoods = phoneList;
  Map<String, List<String>?> currentFilters = {};

  void _filter(Map<String, List<String>?> filters) {
    setState(() {
      currentFilters = filters;
      filteredFoods = phoneList;
      filters.forEach((key, value) {
        if ((value ?? []).isNotEmpty) {
          filteredFoods = filteredFoods.where((phone) {
            switch (key) {
              case 'foodType':
                return value!.contains(phone.foodType);

              case 'price':
                if (value!.contains(prices[2])) {
                  return phone.price <= 1000;
                }
                if (value.contains(prices[1])) {
                  return phone.price <= 500;
                }
                if (value.contains(prices[0])) {
                  return phone.price <= 100;
                }
                return true;
              default:
                return false;
            }
          }).toList();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('food List'),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.filter_alt),
        //     onPressed: () {
        //       showDialog<Filter>(
        //           context: context,
        //           builder: (_) {
        //             return FilterDialog(
        //               initialState: currentFilters,
        //               onApplyFilters: _filter,
        //             );
        //           });
        //     },
        //   ),
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 13, 119, 240),
        hoverColor: Colors.orange,
        child: Container(child: const Icon(Icons.filter_alt)),
        onPressed: () {
          showDialog<Filter>(
              context: context,
              builder: (_) {
                return FilterDialog(
                  initialState: currentFilters,
                  onApplyFilters: _filter,
                );
              });
        },
      ),
      body: Foodlist(foods: filteredFoods),
    );
  }
}
