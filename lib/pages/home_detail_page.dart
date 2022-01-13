import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: Vx.mH8,
            children: [
              '\$${catalog.price}'.text.xl4.red800.bold.make(),
              ElevatedButton(
                onPressed: () {},
                child: 'Buy'.text.xl.make(),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.darkbluish),
                    shape: MaterialStateProperty.all(StadiumBorder())),
              ).pOnly(right: 8).wh(100, 50)
            ],
          ).p32(),
        ),
        body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Hero(
                        tag: Key(catalog.id.toString()),
                        child: Image.network(catalog.image).box.make())
                    .h32(context),
                Expanded(
                    child: Container(
                  child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(MyTheme.darkbluish)
                              .bold
                              .make(),
                          catalog.desc.text.color(Colors.grey).xl.make(),
                        ],
                      ).py64(),
                    ),
                  ),
                ))
              ],
            )));
  }
}
