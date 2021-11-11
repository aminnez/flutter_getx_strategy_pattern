import 'package:get/get.dart';

import '../models/add_user_dto.dart';
import '../models/user_model.dart';
import '../repositories/add_repository.dart';
import 'controller_base.dart';
import 'user_list_controller.dart';

class AddController extends ControllerBase {
  final AddRepository _repository = AddRepository();
  @override
  String get title => 'add user';

  @override
  Future<void> modify() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    buttonLoading.value = true;
    responseMessage.value = '';
    final AddUserDto dto = AddUserDto(
      name: nameTextController.text,
      family: familyTextController.text,
      phone: phoneTextController.text,
    );
    final UserModel? user = await _repository.addUser(dto);
    nameTextController.text = user!.name;
    familyTextController.text = user.family;
    phoneTextController.text = user.phone;
    buttonLoading.value = false;
    responseMessage.value = 'successfully added.';
    Get.find<UserListController>().users.add(user);
  }
}
