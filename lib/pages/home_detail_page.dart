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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Container(
          color: context.canvasColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: Vx.mH8,
            children: [
              '\$${catalog.price}'.text.xl4.red800.bold.make(),
              ElevatedButton(
                onPressed: () {},
                child: 'Add to Cart'.text.xl.make(),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).buttonColor),
                    shape: MaterialStateProperty.all(StadiumBorder())),
              ).pOnly(right: 8).wh(140, 50)
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
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(context.accentColor)
                              .bold
                              .make(),
                          catalog.desc.text.color(Colors.grey).xl.make(),
                          SingleChildScrollView(
                            child:
                                "Takimata duo erat amet no sed dolores, takimata sit magna at amet elitr kasd et ipsum, amet sadipscing labore lorem ipsum eirmod et stet. Eirmod aliquyam elitr dolore sit ut voluptua nonumy. Et voluptua diam nonumy at, gubergren sea eirmod ea et, duo dolores et accusam diam ea et lorem."
                                    .text
                                    .color(Colors.grey)
                                    .make()
                                    .p16(),
                          )
                        ],
                      ).py64(),
                    ),
                  ),
                )),
              ],
            )));
  }
}
