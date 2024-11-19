import 'package:get/get.dart';

class ResponsiveController extends GetxController {
  var screenWidth = 0.0.obs;

  void updateScreenWidth(double width) {
    screenWidth.value = width;
  }

  bool isMobile() {
    return screenWidth.value < 600;
  }

  bool isTablet() {
    return screenWidth.value >= 600 && screenWidth.value < 1200; 
  }
}
