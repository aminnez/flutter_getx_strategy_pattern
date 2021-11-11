import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../full_page/views/user_list.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home';

  const HomePage({final Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('getx strategy pattern'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(UserListPage.route);
                },
                child: const Text('go to fullPage'),
              ),
            ],
          ),
        ),
      );
}
