import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class CartScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CartScreen> {
  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_Tl0Sn5GW15q4pg",
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Sample App",
      "description": "Payment for the some random product",
      "prefill": {"contact": "1111111111", "email": "test@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Pament success");
    Toast.show(
      "Pament success",
    );
  }

  void handlerErrorFailure() {
    print("Pament error");
    Toast.show(
      "Pament error",
    );
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show(
      "External Wallet",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Razor Pay payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: "amount"),
            ),
            SizedBox(
              height: 12,
            ),
            RaisedButton(
              color: Colors.blueGrey,
              child: Text(
                "pay",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class CartScreen extends StatefulWidget {
//   @override
//   _CartScreenState createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   late Razorpay _razorpay;

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("My Cart"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: <Widget>[
//             cartItemsList(),
//             SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text("Subtotal"),
//                       Text(
//                         "\$ 675",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text("Tax"),
//                       Text(
//                         "\$ 0",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       )
//                     ],
//                   ),
//                   Divider(
//                     thickness: 5,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text("Total"),
//                       Text(
//                         "\$ 675",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         child: GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onTap: openCheckout,
//           child: Container(
//             height: 50,
//             color: Theme.of(context).primaryColor,
//             alignment: Alignment.center,
//             child: Text(
//               "Place order",
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget cartItemsList() {
//     return ListView.builder(
//       itemCount: 3,
//       shrinkWrap: true,
//       itemBuilder: (BuildContext context, int index) {
//         return cartItem();
//       },
//     );
//   }

//   Widget cartItem() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: <Widget>[
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                 flex: 1,
//                 child: Image.asset("assets/tshirt.jpg"),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Text("Half Sleeve Tshirt"),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Container(
//                           height: 30,
//                           width: 30,
//                           color: Theme.of(context).primaryColor,
//                           alignment: Alignment.center,
//                           child: Text("-",
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                         ),
//                         Text("1",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black)),
//                         Container(
//                           height: 30,
//                           width: 30,
//                           color: Theme.of(context).primaryColor,
//                           alignment: Alignment.center,
//                           child: Text("-",
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text("\$255",
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black)),
//                 ),
//               )
//             ],
//           ),
//           Divider(
//             thickness: 2,
//           )
//         ],
//       ),
//     );
//   }

//   void openCheckout() async {
//     double price = 5000.56 * 100;
//     print(price);

//     // int.parse((price*100).toString());

//     var options = {
//       'key': 'rzp_test_Tl0Sn5GW15q4pg',
//       'amount': 100,
//       'name': 'Test Payment',
//       'description': 'This is a Text Payment',
//       'prefill': {'contact': '8381897007', 'email': 'test@razorpay.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       print(e);
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     print(response.orderId);

//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (BuildContext context) {
//       return PaymentSuccessful();
//     }));
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     print(response.message);
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print(response);
//   }
// }

// class PaymentSuccessful extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Payment Successful"),
//       ),
//       body: Text(
//         "Payment Successful",
//         style: TextStyle(fontSize: 18),
//       ),
//     );
//   }
// }
