import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/modals/User.dart';
import 'package:store_api_flutter_course/service/api_handler.dart';

import '../widgets/user_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("User")),
        body: FutureBuilder<List<UserModal>>(
          future: APIHandler.getallUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) {
                  return ChangeNotifierProvider.value(
                      value: snapshot.data![index], child: UserWidget());
                });
          },
        ));
  }
}
