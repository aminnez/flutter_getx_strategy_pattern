import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ControllerBase extends GetxController {
  String get title;
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController familyTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  final RxBool buttonLoading = false.obs;
  final RxBool pageLoading = false.obs;

  final RxString responseMessage = ''.obs;

  Future<void> modify();
}
