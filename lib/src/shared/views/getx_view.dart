import 'package:flutter/widgets.dart';
import 'package:get/get_instance/get_instance.dart';

typedef GetxViewBuilder<S> = S Function();

/// GetxView is a great way of quickly access your Controller
/// without having to call Get.put(AwesomeController()) and
/// Get.find<AwesomeController>() yourself.
///
/// Sample:
/// ```
/// class AwesomeController extends GetxController {
///   final String title = 'My Awesome View';
/// }
///
/// class AwesomeView extends GetxView<AwesomeController> {
///   /// if you need you can pass the tag for
///   /// Get.find<AwesomeController>(tag:"myTag");
///   @override
///   final String tag = "myTag";
///
///   AwesomeView(GetxViewBuilder controller,{Key key}):super(controller,key:key);
///
///   @override
///   Widget build(BuildContext context) {
///     return Container(
///       padding: EdgeInsets.all(20),
///       child: Text( controller.title ),
///     );
///   }
/// }
///``
abstract class GetxView<T> extends StatelessWidget {
  final GetxViewBuilder<T> _controller;
  const GetxView(this._controller, {final Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().putOrFind<T>(_controller, tag: tag)!;

  @override
  Widget build(final BuildContext context);
}
