import 'package:get/get.dart';

import '../../../shared/models/edit_user_dto.dart';
import '../../../shared/models/user_model.dart';
import '../../../shared/repositories/edit_repository.dart';
import 'controller_base.dart';

class EditController extends ControllerBase {
  final EditRepository _repository = EditRepository();
  final UserModel userModel;

  EditController(this.userModel);

  @override
  String get title => 'edit user';

  @override
  void onInit() {
    nameTextController.text = userModel.name;
    familyTextController.text = userModel.family;
    phoneTextController.text = userModel.phone;
    super.onInit();
  }

  @override
  Future<void> modify() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    buttonLoading.value = true;
    final EditUserDto dto = EditUserDto(
      name: nameTextController.text,
      family: familyTextController.text,
      phone: phoneTextController.text,
    );
    final UserModel? user = await _repository.editUser(userModel.id, dto);
    buttonLoading.value = false;
    Get.back(result: user);
  }
}
