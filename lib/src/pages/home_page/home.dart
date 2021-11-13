import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dialog_page/dialog_page.dart' as dialog;
import '../full_page/full_page.dart' as full;

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
                  Get.toNamed(full.UserListPage.path);
                },
                child: const Text('go to fullPage'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(dialog.UserListPage.path);
                },
                child: const Text('go to dialogPage'),
              ),
            ],
          ),
        ),
      );
}
