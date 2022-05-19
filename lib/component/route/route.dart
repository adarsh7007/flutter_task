import 'package:flutter/material.dart';

import 'package:my_app/Screen/filter/filter_screen.dart';
import 'package:my_app/Screen/filtering.dart';
import 'package:my_app/Screen/geolocation.dart';
import 'package:my_app/Screen/location/mapLocation.dart';
import 'package:my_app/Screen/main/shopingcart/cart.dart';
import 'package:my_app/Screen/main/shopingcart/cartmodel.dart';
import 'package:my_app/Screen/main/shopingcart/homecart.dart';
import 'package:my_app/Screen/onBoarding.dart';
import 'package:my_app/Screen/payment/rezorPay.dart';
import 'package:my_app/Screen/shopping/nav.dart';
import 'package:scoped_model/scoped_model.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/FirstScreen':
        return MaterialPageRoute(builder: (_) => filtering());
      case '/CartScreen':
        return MaterialPageRoute(builder: (_) => CartScreen());
      case 'filter':
        return MaterialPageRoute(builder: (_) => FilterPage());
      // Validation of correct data type
      // if (args is List<String>) {
      //   return MaterialPageRoute(
      //     builder: (_) => SecondScreen(
      //       listPlayerNames: args,
      //     ),
      //   );
      // }
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      // return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
