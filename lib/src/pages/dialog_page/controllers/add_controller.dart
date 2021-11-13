import 'package:get/get.dart';

import '../../../shared/models/add_user_dto.dart';
import '../../../shared/models/user_model.dart';
import '../../../shared/repositories/add_repository.dart';
import 'controller_base.dart';

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
    Get.back(result: user);
  }
}
