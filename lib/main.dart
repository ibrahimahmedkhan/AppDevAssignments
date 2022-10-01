// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

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
        body: ListView(
            children: products
                .map(
                  (product) => ProductTile(),
                )
                .toList()),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  Product product
  const ProductTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text(product.name),
      trailing: product.isAdded == false
          ? IconButton(
              onPressed: () {
                product.isAdded = true;
              },
              icon: Icon(Icons.add),
            )
          : Row(
              children: [
                Icon(Icons.remove),
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
  bool isAdded = false;
  int quantity = 0;

  Product({required this.name, required this.id});
}
