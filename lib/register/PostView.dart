import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'PostController.dart';
import 'package:pas_shofiyyulhilmi/login/logView.dart';

class PostView extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login to Your Account',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 16),
            // Input Fields
            _buildInputField(
              controller: postController.usernameController,
              label: 'Username',
              icon: Icons.person,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: postController.passwordController,
              label: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Hardcoded username and password check
                  if (postController.usernameController.text == 'admin' &&
                      postController.passwordController.text == 'admin') {
                    // Successful login, navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogView()),
                    );
                  } else {
                    // If username or password is incorrect, show an error
                    Get.snackbar('Error', 'Invalid username or password');
                  }
                },
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 12,
                  ),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }
}
