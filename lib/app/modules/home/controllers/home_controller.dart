import 'package:get/get.dart';

class HomeController extends GetxController {
  final displayName = 'Shopper'.obs;

  @override
  void onInit() {
    final username = Get.arguments;
    if (username is String && username.trim().isNotEmpty) {
      displayName.value = username.trim();
    }
    super.onInit();
  }
}
