import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void goToAnime() {
    selectedIndex.value = 0;
    Get.offAllNamed('/anime');
  }

  void goToFavorite() {
    selectedIndex.value = 1;
    Get.offAllNamed('/favorite');
  }

  void goToProfile() {
    selectedIndex.value = 2;
    Get.offAllNamed('/profile');
  }

  void goToLogin() {
    Get.offAllNamed('/');
  }
}
