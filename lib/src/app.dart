import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/full_page/bindings/add_binding.dart';
import 'pages/full_page/bindings/edit_binding.dart';
import 'pages/full_page/bindings/user_list_binding.dart';
import 'pages/full_page/controllers/add_controller.dart';
import 'pages/full_page/controllers/edit_controller.dart';
import 'pages/full_page/views/add_or_edit.dart';
import 'pages/full_page/views/user_list.dart';
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
        initialRoute: UserListPage.route,
        getPages: [
          GetPage(name: HomePage.route, page: () => const HomePage()),
          GetPage(
            name: UserListPage.route,
            page: () => const UserListPage(),
            binding: UserListBinding(),
          ),
          GetPage(
            name: AddOrEditPage.addRoute,
            page: () => const AddOrEditPage<AddController>(),
            binding: AddBindings(),
          ),
          GetPage(
            name: AddOrEditPage.editRoute,
            page: () => const AddOrEditPage<EditController>(),
            binding: EditBindings(),
          ),
        ],
      );
}
