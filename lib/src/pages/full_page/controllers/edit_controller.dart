import 'package:get/get.dart';

import '../../../shared/models/edit_user_dto.dart';
import '../../../shared/models/user_model.dart';
import '../../../shared/repositories/edit_repository.dart';
import 'controller_base.dart';
import 'user_list_controller.dart';

class EditController extends ControllerBase {
  final EditRepository _repository = EditRepository();
  final int userId;

  EditController(this.userId);

  @override
  String get title => 'edit user';

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  @override
  Future<void> modify() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    buttonLoading.value = true;
    responseMessage.value = '';
    final EditUserDto dto = EditUserDto(
      name: nameTextController.text,
      family: familyTextController.text,
      phone: phoneTextController.text,
    );
    final UserModel? user = await _repository.editUser(userId, dto);
    nameTextController.text = user!.name;
    familyTextController.text = user.family;
    phoneTextController.text = user.phone;
    buttonLoading.value = false;
    responseMessage.value = 'successfully edited.';
    final userListController = Get.find<UserListController>();
    final changedUserIndex =
        userListController.users.indexWhere((final e) => e.id == userId);
    userListController.users[changedUserIndex] = user;
    userListController.users.refresh();
  }

  Future<void> getUser() async {
    pageLoading.value = true;
    final UserModel? user = await _repository.getUsers(userId);
    nameTextController.text = user!.name;
    familyTextController.text = user.family;
    phoneTextController.text = user.phone;
    pageLoading.value = false;
  }
}
