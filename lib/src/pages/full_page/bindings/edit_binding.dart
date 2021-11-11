import 'package:get/get.dart';

import '../controllers/edit_controller.dart';

class EditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditController(int.tryParse(Get.parameters['id'] ?? '') ?? 0),
    );
  }
}
