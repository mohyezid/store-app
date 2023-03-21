import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/modals/Category.dart';
import 'package:store_api_flutter_course/service/api_handler.dart';

import '../widgets/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: FutureBuilder<List<Category>>(
          future: APIHandler.getallCategory(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data == null) {
              return Text('no data');
            }

            return GridView.builder(
                shrinkWrap: true,
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (ctx, index) {
                  return ChangeNotifierProvider.value(
                      value: snapshot.data![index], child: CategoryWidget());
                });
          })),
    );
  }
}
