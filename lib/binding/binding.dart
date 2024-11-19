import 'package:get/get.dart';
import 'package:pas_shofiyyulhilmi/controller/favorite_controller.dart';
import 'package:pas_shofiyyulhilmi/controller/profile_controller.dart';
import 'package:pas_shofiyyulhilmi/menus/anime/footballController.dart';
import 'package:pas_shofiyyulhilmi/menus/anime/football_api.dart';
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeController>(() => AnimeController());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
// ohh jadi fungsinya binding adalah agar dapat menggunakan controller nya berulang kali tanpa harus membuat manual lagi setiap dipanggil
