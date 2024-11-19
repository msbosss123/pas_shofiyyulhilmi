import 'package:get/get.dart';
import 'ApiServis.dart';
import 'PostModel.dart';
import 'package:flutter/material.dart';

class PostController extends GetxController {
  var isLoading = false.obs;
  var postList = <PostModel>[].obs;

  TextEditingController usernameController = TextEditingController(); // ini fungsinya untuk menangani inputan dari user?
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> registerUser(String username, String password, String fullName, String email) async {
    isLoading.value = true;

    postList.clear();

    try {
      final response = await ApiService().registerUser(username, password, fullName, email);
      postList.add(response); // Menambahkan hasil response ke list
    } catch (e) { // Menangani error
      print(e);
    } finally {
      isLoading.value = false; // Mengubah status loading
    }
  }

  void loginUser(String text, String text2) {}
}
