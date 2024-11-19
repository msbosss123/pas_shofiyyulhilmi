import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LogController extends GetxController {
  var isLoading = false.obs;
  var postList = <LogModel>[].obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(String username, String password) async {
    isLoading.value = true;
    postList.clear();

    try {
      // Hardcoded check for username and password
      if (username == 'admin' && password == 'admin') {
        LogModel response = LogModel(status: true, message: 'Login berhasil');
        postList.add(response);

        // If login is successful, navigate to the next screen
        Get.snackbar(
          'Success',
          'Login berhasil',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Redirect to the '/anime' screen after successful login
        Get.offAllNamed('/anime');
      } else {
        // If username or password is incorrect
        throw Exception('Invalid username or password');
      }
    } catch (e) {
      print(e);
      // Show error message
      Get.snackbar(
        'Error',
        'Login gagal',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}

class LogModel {
  final bool status;
  final String message;

  LogModel({required this.status, required this.message});
}

class LogService {
  // This function can remain empty as we're handling the login logic in the controller
}
