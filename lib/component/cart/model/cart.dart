import 'package:flutter/material.dart';

class CartModel extends StatefulWidget {
  get cart => null;

  get total => null;

  nav createState() => nav();
}

class nav extends State<CartModel> {
  List<Product> cart = [];
  double totalCartValue = 0;

  int get total => cart.length;

  void addProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    print(index);
    if (index == 0)
      updateProduct(product, product.qty + 1);
    else {
      cart.add(product);
      calculateTotal();
    }
  }

  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = 1;
    cart.removeWhere((item) => item.id == product.id);
    calculateTotal();
  }

  void updateProduct(product, qty) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = qty;
    if (cart[index].qty == 0) removeProduct(product);

    calculateTotal();
  }

  void clearCart() {
    cart.forEach((f) => f.qty = 1);
    cart = [];
  }

  void calculateTotal() {
    totalCartValue = 0;
    cart.forEach((f) {
      totalCartValue += f.price * f.qty;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Product {
  int id;
  String title;
  String imgUrl;
  double price;
  int qty;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.qty,
      required this.imgUrl});
}
