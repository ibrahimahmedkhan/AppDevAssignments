// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:math';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:badges/badges.dart';

void main() {
  // products.add(Product(name: "cap", id: id))
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
                (product) => ProductTile(
                    product: product,
                    onPress: () {
                      setState(() {});
                    }),
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
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => widget.onPress(),
      iconSize: 30,
      icon: Badge(
        badgeContent: Text(products
            .where((product) => product.quantity > 0)
            .length
            .toString()),
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

class ProductTile extends StatefulWidget {
  final Product product;
  final VoidCallback onPress;

  const ProductTile({Key? key, required this.product, required this.onPress})
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
                widget.onPress();
              },
              icon: const Icon(Icons.add),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    widget.product.subtractQuantity();
                    widget.product.quantity == 0
                        ? widget.onPress()
                        : setState(() {});
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(widget.product.quantity.toString()),
                IconButton(
                  onPressed: () {
                    widget.product.addQuantity();
                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
    );
  }
}

List<Product> products = [];


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
