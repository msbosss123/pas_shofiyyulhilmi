import 'package:pas_shofiyyulhilmi/menus/anime/favorite.dart';
import 'package:pas_shofiyyulhilmi/menus/database/db_helper.dart';

import 'footballController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bottom_nav.dart'; // Import bottom nav
import '../../database/db_helper.dart'; // Import database helper

class AnimeView extends StatelessWidget {
  final AnimeController animeController = Get.put(AnimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('football List'),
        automaticallyImplyLeading: false, // Hilangkan tombol back
      ),
      body: Obx(() {
        if (animeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (animeController.postList.isEmpty) {
          return const Center(child: Text('No Data Available'));
        }
        return ListView.builder(
          itemCount: animeController.postList.length,
          itemBuilder: (context, index) {
            final post = animeController.postList[index];
            RxBool isFavorited = false.obs;

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: ListTile(
                leading: Image.network(
                  post.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(post.title),
                subtitle: Text(post.type),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() {
                      return IconButton(
                        icon: Icon(
                          isFavorited.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavorited.value ? Colors.red : Colors.grey,
                        ),
                        onPressed: () async {
                          try {
                            // Toggle favorit status
                            if (!isFavorited.value) {
                              // Add to favorites
                              var instance;
                              await DatabaseHelper.instance.addFavorite(post);
                              isFavorited.value = true;
                              Get.snackbar(
                                'Success',
                                '${post.title} added to favorites',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                duration: const Duration(seconds: 2),
                              );
                            } else {
                              // Remove from favorites
                              await DatabaseHelper.instance
                                  .removeFavorite(post.id);
                              isFavorited.value = false;
                              Get.snackbar(
                                'Removed',
                                '${post.title} removed from favorites',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.orange,
                                colorText: Colors.white,
                                duration: const Duration(seconds: 2),
                              );
                            }
                          } catch (e) {
                            Get.snackbar(
                              'Error',
                              'Failed to update favorites',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              duration: const Duration(seconds: 2),
                            );
                          }
                        },
                      );
                    }),
                    IconButton(
                      icon: const Icon(Icons.navigate_next),
                      onPressed: () {
                        Get.toNamed('/favorite');
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: BottomNavBar(), // Tambahkan bottom navigation bar
    );
  }
}

class DatabaseHelper {
  static var instance;
}
