import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/views/getx_view.dart';
import '../controllers/controller_base.dart';

const SizedBox _space = SizedBox(height: 10);

class AddOrEditPage<T extends ControllerBase> extends GetxView<T> {
  const AddOrEditPage(final GetxViewBuilder<T> controller, {final Key? key})
      : super(controller, key: key);

  @override
  Widget build(final BuildContext context) => _body();

  Widget _body() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                _userName(),
                _space,
                _userFamily(),
                _space,
                _userPhone(),
                _space,
                _space,
                _button(),
              ],
            ),
          ),
        ),
      );

  Obx _button() => Obx(() => ElevatedButton.icon(
        onPressed: _onModifyTap(),
        icon: controller.buttonLoading.value
            ? const SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(),
              )
            : const Icon(Icons.save),
        label: const Text('save'),
      ));

  VoidCallback? _onModifyTap() =>
      controller.buttonLoading.value ? null : () => controller.modify();

  TextFormField _userName() => TextFormField(
        controller: controller.nameTextController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: Text(
                    'Name',
                  ),
                ),
                WidgetSpan(
                  child: Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (final value) => value!.isEmpty ? 'name is required' : null,
      );

  TextFormField _userFamily() => TextFormField(
        controller: controller.familyTextController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: Text(
                    'Family',
                  ),
                ),
                WidgetSpan(
                  child: Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (final value) =>
            value!.isEmpty ? 'family is required' : null,
      );

  TextFormField _userPhone() => TextFormField(
        controller: controller.phoneTextController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: Text(
                    'Phone',
                  ),
                ),
                WidgetSpan(
                  child: Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
        keyboardType: TextInputType.phone,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (final value) => value!.isEmpty ? 'phone is required' : null,
      );
}
