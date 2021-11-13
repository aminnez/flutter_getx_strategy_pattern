import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/models/user_model.dart';
import '../controllers/user_list_controller.dart';

class UserListPage extends GetView<UserListController> {
  static const String path = '/dialog-page/user-list';

  const UserListPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('users list'),
        ),
        floatingActionButton: _addUserButton(),
        body: Obx(
          () => controller.loading.value ? _loading() : _userList(context),
        ),
      );

  Container _userList(final BuildContext context) => Container(
        height: context.height,
        child: RefreshIndicator(
          onRefresh: controller.refreshUsers,
          child: Obx(() => ListView.builder(
                itemBuilder: (final context, final index) =>
                    _userItem(controller.users[index]),
                itemCount: controller.users.length,
              )),
        ),
      );

  Widget _userItem(final UserModel user) => ListTile(
        title: Text('${user.name} ${user.family}'),
        subtitle: Text(user.phone),
        trailing: IconButton(
          onPressed: () => controller.deleteUser(user),
          icon: const Icon(Icons.delete),
        ),
        onTap: () => controller.openEditDialog(user),
      );

  Widget _loading() => LinearProgressIndicator(
        backgroundColor: Get.context!.theme.primaryColorLight,
        valueColor: AlwaysStoppedAnimation<Color>(
          Get.context!.theme.colorScheme.secondary,
        ),
      );

  FloatingActionButton _addUserButton() => FloatingActionButton(
        onPressed: controller.openAddDialog,
        child: const Icon(Icons.add),
      );
}
