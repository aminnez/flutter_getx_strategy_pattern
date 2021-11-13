import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/models/delete_dto.dart';
import '../../../shared/models/user_model.dart';
import '../../../shared/repositories/user_list_repository.dart';
import '../views/add_or_edit.dart';
import 'add_controller.dart';
import 'edit_controller.dart';

class UserListController extends GetxController {
  RxBool loading = true.obs;
  RxList<UserModel> users = <UserModel>[].obs;
  final UserListRepository _repository = UserListRepository();

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  Future<void> getUsers() async {
    final _users = await _repository.getUsers();
    loading.value = false;
    users.addAll(_users!);
  }

  Future<void> refreshUsers() async {
    clearUsers();
    loading.value = true;
    await getUsers();
  }

  Future<void> deleteUser(final UserModel user) async {
    await _repository.deleteUser(DeleteDto(user.id));
    users.removeWhere((final element) => element.id == user.id);
    users.refresh();
  }

  Future<void> openEditDialog(final UserModel user) async {
    // Get.lazyPut(() => EditController(user));
    final userModel = await Get.dialog<UserModel>(Dialog(
      child: AddOrEditPage(() => EditController(user)),
    ));

    if (userModel != null) {
      final changedUserIndex =
          users.indexWhere((final e) => e.id == userModel.id);
      users[changedUserIndex] = userModel;
      users.refresh();
    }
  }

  Future<void> openAddDialog() async {
    // Get.lazyPut(() => AddController());
    final userModel = await Get.dialog<UserModel>(Dialog(
      child: AddOrEditPage(() => AddController()),
    ));
    if (userModel != null) {
      users.add(userModel);
    }
  }

  void clearUsers() {
    users.clear();
  }
}
