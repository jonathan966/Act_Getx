import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  final title = 'Login'.obs;
  final formKey = GlobalKey<FormState>();
  var email = ''.obs;
  var password = ''.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty || value.length < 8) {
      return 'Please enter a valid password';
    }
    return null;
  }

  void submitAttempt() async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      Get.focusScope!.unfocus();

      // Guardar email y contraeña en  SharedPreferences
      await saveCredentials(emailController.text, passwordController.text);

      // Impreme el mensaje en consola
      print('Email y Contraseña guardada en SharedPreferences');

      Get.snackbar('Success', 'Login');
    }
  }

  Future<void> saveCredentials(String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('password', password);
    } catch (e) {
      //Manejar el error, por ejemplo, SharedPreferences no disponible
      print('Error saving credentials: $e');
    }
  }
}
