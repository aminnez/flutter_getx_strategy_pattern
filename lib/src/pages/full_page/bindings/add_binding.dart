import 'package:get/get.dart';

import '../controllers/add_controller.dart';

class AddBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddController());
  }
}
