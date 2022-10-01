// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

import 'cart.dart';

import 'package:badges/badges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ShoppingCartButton(
        onPress: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Cart(products: products),
          ));
          setState(() {});
        },
      ),
      body: ListView(
          children: products
              .map(
                (product) => ProductTile(product: product, isClicked: () {}),
              )
              .toList()),
    );
  }
}

class ShoppingCartButton extends StatefulWidget {
  final VoidCallback onPress;

  const ShoppingCartButton({Key? key, required this.onPress}) : super(key: key);

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  int _items = 0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => widget.onPress,
      iconSize: 30,
      icon: Badge(
        badgeContent: Text(products
            .where((product) => product.quantity > 0)
            .length
            .toString()),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class ProductTile extends StatefulWidget {
  final Product product;
  final VoidCallback isClicked;

  const ProductTile({Key? key, required this.product, required this.isClicked})
      : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text("P${widget.product.id}"),
      ),
      title: Text(widget.product.name),
      trailing: widget.product.quantity == 0
          ? IconButton(
              onPressed: () {
                widget.product.addQuantity();
                setState(() {});
                print(widget.product);
              },
              icon: Icon(Icons.add),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {});
                    widget.product.subtractQuantity();
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(widget.product.quantity.toString()),
                IconButton(
                  onPressed: () {
                    setState(() {});
                    widget.product.addQuantity();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
    );
  }
}

List<Product> products = [
  Product(name: "Cap", id: 1),
  Product(name: "Shirt", id: 2),
  Product(name: "Shoe", id: 3),
  Product(name: "Tie", id: 4)
];

class Product {
  final String name;
  final int id;
  int quantity = 0;

  addQuantity() {
    quantity++;
  }

  subtractQuantity() {
    quantity = max(quantity - 1, 0);
  }

  Product({required this.name, required this.id});
}
