import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/modals/Product.dart';
import 'package:store_api_flutter_course/screens/product_detail-screen.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductModal productModelProvider =
        Provider.of<ProductModal>(context);

    Size size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Theme.of(context).cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child:
                      ProductDetail(id: productModelProvider.id.toString())));
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: RichText(
                        text: TextSpan(
                            text: '\$',
                            style: TextStyle(
                                color: Color.fromRGBO(33, 150, 243, 1)),
                            children: [
                          TextSpan(
                              text: productModelProvider.price.toString(),
                              style: TextStyle(color: lightTextColor))
                        ])),
                  ),
                  Icon(IconlyBold.heart),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                    width: double.infinity,
                    height: size.height * 0.2,
                    child: FancyShimmerImage(
                      errorWidget: const Icon(
                        IconlyBold.danger,
                        color: Colors.red,
                        size: 22,
                      ),
                      height: size.height * 0.2,
                      imageUrl: productModelProvider.images![0],
                      width: double.infinity,
                      boxFit: BoxFit.fill,
                    ))),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                productModelProvider.title!,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            )
          ],
        ),
      ),
    );
  }
}
// FancyShimmerImage(
//                   imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
//                   boxFit: BoxFit.fill,
//                   errorWidget: const Icon(
//                     IconlyBold.danger,
//                     color: Colors.red,
//                     size: 22,
//                   ),
//                   width: double.infinity,
//                   height: size.height * 0.2,
//                 )