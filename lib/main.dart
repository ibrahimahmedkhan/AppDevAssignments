// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        floatingActionButton: const Icon(Icons.shopping_cart),
        body: ListView(
            children: products
                .map(
                  (product) => ProductTile(
                    product: product,
                  ),
                )
                .toList()),
      ),
    );
  }
}

class ProductTile extends StatefulWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

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
