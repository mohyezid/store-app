import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/modals/Product.dart';

import '../service/api_handler.dart';
import '../widgets/feeds_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<ProductModal> productlist = [];
  void didChangeDependencies() {
    getProducts();

    super.didChangeDependencies();
  }

  Future<dynamic> getProducts() async {
    productlist = await APIHandler.getallProdyct();
    setState(() {});
    print(productlist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: GridView.builder(
          itemCount: productlist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 6.0,
              childAspectRatio: 0.7),
          itemBuilder: ((context, index) {
            return productlist.isEmpty
                ? Container()
                : ChangeNotifierProvider.value(
                    value: productlist[index], child: FeedsWidget());
          })),
    );
  }
}
