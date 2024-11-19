import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_shofiyyulhilmi/binding/binding.dart';
import 'package:pas_shofiyyulhilmi/login/logView.dart';
import 'package:pas_shofiyyulhilmi/menus/anime/football_api.dart';
import 'package:pas_shofiyyulhilmi/menus/anime/favorite.dart';
import 'package:pas_shofiyyulhilmi/menus/anime/profil.dart';
import 'package:pas_shofiyyulhilmi/register/PostView.dart' as register;
 // ignore: prefer_typing_uninitialized_variables


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => register.PostView()),
        GetPage(name: '/login', page: () => LogView()),
        GetPage(
          name: '/anime',
          page: () => AnimeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/favorite',
          page: () => FavoritePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/profile',
          page: () => const Profile(),
          binding: HomeBinding(),
        ),
      ],
      initialRoute: '/',
      home: register.PostView(),
    );
  }
}

class PostView {
}
