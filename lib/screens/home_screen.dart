import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/modals/Product.dart';
import 'package:store_api_flutter_course/screens/category_screen.dart';
import 'package:store_api_flutter_course/screens/user_screen.dart';
import 'package:store_api_flutter_course/service/api_handler.dart';
import 'package:store_api_flutter_course/widgets/AppBarIcon.dart';
import 'package:store_api_flutter_course/widgets/category_widget.dart';

import '../widgets/feeds_widget.dart';
import '../widgets/sale_widget.dart';
import 'feed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final _textEdit;
  // List<ProductModal> productlist = [];
  @override
  void initState() {
    _textEdit = TextEditingController();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _textEdit.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  // void didChangeDependencies() {
  //   getProducts();

  //   super.didChangeDependencies();
  // }

  // Future<dynamic> getProducts() async {
  //   productlist = await APIHandler.getallProdyct();
  //   setState(() {});
  //   print(productlist);
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            actions: [
              AppBarIcon(
                  function: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: UserScreen()));
                  },
                  icon: IconlyBold.user3)
            ],
            title: Text('home'),
            leading: AppBarIcon(
                function: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: CategoryScreen()));
                },
                icon: IconlyBold.category),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _textEdit,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      suffixIcon:
                          Icon(IconlyLight.search, color: lightIconsColor),
                      fillColor: Theme.of(context).cardColor,
                      hintText: 'search',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Theme.of(context).cardColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.secondary))),
                ),
                SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Swiper(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return const SaleWidget();
                            },
                            autoplay: true,
                            // control: SwiperControl(),
                            pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                activeColor: Colors.red,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                "Latest Products",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Spacer(),
                              AppBarIcon(
                                  function: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FeedScreen()));
                                  },
                                  icon: IconlyBold.arrowRight2),
                            ],
                          ),
                        ),
                        FutureBuilder<List<ProductModal>>(
                            future: APIHandler.getallProdyct(),
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 12,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 8.0,
                                          mainAxisSpacing: 6.0,
                                          childAspectRatio: 0.7),
                                  itemBuilder: ((context, index) {
                                    return snapshot.data!.isEmpty
                                        ? Container()
                                        : ChangeNotifierProvider.value(
                                            value: snapshot.data![index],
                                            child: FeedsWidget());
                                  }));
                            })),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
