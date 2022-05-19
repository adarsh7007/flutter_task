import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/Screen/bottomsheet.dart';
import 'package:my_app/Screen/drawerBottom.dart';
import 'package:my_app/Screen/filter/filter_screen.dart';
import 'package:my_app/Screen/filtering.dart';
import 'package:my_app/Screen/geolocation.dart';
import 'package:my_app/Screen/homePage.dart';
import 'package:my_app/Screen/location/mapLocation.dart';
import 'package:my_app/Screen/main/shopingcart/cart.dart';
import 'package:my_app/Screen/main/shopingcart/cartmodel.dart';
import 'package:my_app/Screen/main/shopingcart/homecart.dart';
import 'package:my_app/Screen/onBoarding.dart';
import 'package:my_app/Screen/payment/rezorPay.dart';
import 'package:my_app/Screen/shopping/nav.dart';
import 'package:my_app/component/drawer_app.dart';
import 'package:my_app/component/route/route.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp(
    model: CartModel(),
  ));
}

class MyApp extends StatelessWidget {
  final CartModel model;

//   const MyApp({Key? key, required this.model}) : super(key: key);
  const MyApp({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CartModel>(
        model: model,
        child: MaterialApp(
          home: bottomdrawer(),

          //onGenerateRoute: RouteGenerator.generateRoute,
          // routes: {'/cart': (context) => CartPage()},
        ));
  }
}

// class test extends StatelessWidget {
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//         statusBarColor: Colors.orange,
//         statusBarBrightness: Brightness.dark,
//         statusBarIconBrightness: Brightness.dark,
//         systemNavigationBarIconBrightness: Brightness.light));
//     return Scaffold(
//       body: Container(
//         child: Text('njknf'),
//       ),
//     );
//   }
// }



//

// import 'package:flutter/material.dart';
// import 'package:my_app/Screen/main/shopingcart/cart.dart';
// import 'package:my_app/Screen/main/shopingcart/homecart.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'Screen/main/shopingcart/cartmodel.dart';

// void main() => runApp(MyApp(
//       model: CartModel(),
//     ));

// class MyApp extends StatelessWidget {
//   final CartModel model;

//   const MyApp({Key? key, required this.model}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return ScopedModel<CartModel>(
//       model: model,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Shopping Cart',
//         home: HomeCart(),
//         routes: {'/cart': (context) => CartPage()},
//       ),
//     );
//   }
// }
