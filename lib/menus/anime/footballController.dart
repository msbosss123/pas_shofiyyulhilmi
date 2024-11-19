import 'package:get/get.dart';
import 'package:pas_shofiyyulhilmi/menus/anime/football_Model.dart';
import 'package:pas_shofiyyulhilmi/menus/football/football_Model.dart';

import 'footballService.dart';

class AnimeController extends GetxController {
  var isLoading = false.obs;
  var postList = <PostModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      var posts = await FootballService.fetchPosts();
      postList.assignAll(posts);
    } catch (e) {
      print('Error while getting data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
