import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passcodeController = TextEditingController();

  final isPasscodeHidden = true.obs;
  final rememberMe = true.obs;
  final isSubmitting = false.obs;

  void togglePasscodeVisibility() {
    isPasscodeHidden.toggle();
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  Future<void> login() async {
    final username = usernameController.text.trim();
    final passcode = passcodeController.text.trim();

    if (username.isEmpty) {
      Get.snackbar(
        'Username required',
        'Please enter your username to continue shopping.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (passcode.isEmpty) {
      Get.snackbar(
        'Passcode required',
        'Please enter your passcode to access your account.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isSubmitting.value = true;
    await Future.delayed(const Duration(milliseconds: 900));
    isSubmitting.value = false;

    Get.offAllNamed(
      Routes.HOME,
      arguments: username,
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    passcodeController.dispose();
    super.onClose();
  }
}
