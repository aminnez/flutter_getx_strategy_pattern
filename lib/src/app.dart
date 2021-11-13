import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/dialog_page/dialog_page.dart' as dialog;
import 'pages/full_page/full_page.dart' as full;
import 'pages/home_page/home.dart';

class App extends StatelessWidget {
  const App({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => GetMaterialApp(
        title: 'Flutter getx strategy pattern',
        theme: ThemeData(
          splashColor: Colors.indigo[100],
          selectedRowColor: Colors.red,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.indigo,
            accentColor: Colors.pinkAccent,
          ),
        ),
        initialRoute: HomePage.route,
        getPages: [
          GetPage(name: HomePage.route, page: () => const HomePage()),
          GetPage(
            name: full.UserListPage.path,
            page: () => const full.UserListPage(),
            binding: full.UserListBinding(),
            children: [
              GetPage(
                name: full.AddOrEditPage.addPath,
                page: () => const full.AddOrEditPage<full.AddController>(),
                binding: full.AddBindings(),
              ),
              GetPage(
                name: full.AddOrEditPage.editPath,
                page: () => const full.AddOrEditPage<full.EditController>(),
                binding: full.EditBindings(),
              ),
            ],
          ),
          GetPage(
            name: dialog.UserListPage.path,
            page: () => const dialog.UserListPage(),
            binding: dialog.UserListBinding(),
          ),
        ],
      );
}
