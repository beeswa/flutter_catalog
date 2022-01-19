import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  // final Item catalog;

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Cart'.text.color(Theme.of(context).accentColor).make(),
      ),
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          '\$${_cart.totalPrice}'.text.xl4.bold.make(),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: 'Buying not supported yet'.text.make()));
            },
            child: 'Buy'.text.xl.make(),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder())),
          ).wh(100, 50)
        ],
      ),
    ).px32();
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.check),
              title: _cart.items[index].name.text.make(),
              trailing: Icon(Icons.remove_circle_outline),
            ));
  }
}
