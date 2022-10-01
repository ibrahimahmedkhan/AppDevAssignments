import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

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
      floatingActionButton: IconButton(
        icon: Icon(Icons.back_hand),
        onPressed: () {Navigator.pop(context);},
      ),
      body: ListView(
        children: widget.products
            .where((product) => product.quantity > 0)
            .map(
              (product) => ProductsInCart(
                product: product,
                emptied: () {
                  setState(() {});
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class ProductsInCart extends StatefulWidget {
  final Product product;
  final VoidCallback emptied;

  const ProductsInCart({Key? key, required this.product, required this.emptied})
      : super(key: key);

  @override
  State<ProductsInCart> createState() => _ProductsInCartState();
}

class _ProductsInCartState extends State<ProductsInCart> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text("P${widget.product.id}"),
      ),
      title: Text(widget.product.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              widget.emptied();
              setState(() {});
              widget.product.subtractQuantity();
            },
            icon: const Icon(Icons.remove),
          ),
          Text(widget.product.quantity.toString()),
          IconButton(
            onPressed: () {
              widget.emptied();
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
