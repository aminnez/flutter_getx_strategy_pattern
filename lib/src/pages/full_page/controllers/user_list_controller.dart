import 'package:get/get.dart';

import '../models/delete_dto.dart';
import '../models/user_model.dart';
import '../repositories/user_list_repository.dart';

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

  void clearUsers() {
    users.clear();
  }
}
