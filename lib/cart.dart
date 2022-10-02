import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:collection/collection.dart';

class Cart extends StatefulWidget {
  final List<Product> products;

  const Cart({Key? key, required this.products}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: ListView(
        children: widget.products
            .where((product) => product.quantity > 0)
            .mapIndexed(
              (i, product) => ProductTile(
                product: product,
                onPress: () {
                  setState(() {});
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
